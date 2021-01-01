import { tag } from "./TagController";
import { join } from "path";
import {
  getDataFromQuery,
  getUser,
  removeAccents,
  toCamelCase,
} from "../common";
import { ISettingWeb } from "../models/SettingWeb";
import { dbColunm, DEFAULT_COL, sqlHelper } from "../common";
import * as _ from "lodash";
import moment from "moment";
import { ISettingPage } from "../models/SettingPage";
import { db } from "../db";
import { IPost } from "../models/Post";
const { JSDOM } = require("jsdom");
const { window } = new JSDOM("");
const $ = require("jquery")(window);
var schedule = require("node-schedule");
const rp = require("request-promise");
const cheerio = require("cheerio");
const fs = require("fs");
class postController {
  tablesName = "post";
  col: dbColunm[] = [
    {
      id: "post.Title",
      title: "title",
    },
    {
      id: "Slug",
    },
    {
      id: "Source_Url",
    },
    {
      id: "Source_Id",
    },
    {
      id: "Category_Id",
    },
    {
      id: "Summary",
    },
    {
      id: "Avatar",
    },
    {
      id: "Publish_Date",
    },
    {
      id: "setting_web.Title",
      title: "source",
    },
    {
      id: "setting_web.Id",
      title: "settingWebId",
    },
  ];
  colElement: dbColunm[] = [
    {
      id: "Title",
    },
    {
      id: "Post_Property",
    },
    {
      id: "Selector",
    },
  ];
  colSave = [
    "Title",
    "Avatar",
    "Source_Url",
    "Slug",
    "Tag",
    "Source_Id",
    "Summary",
    "Publish_Date",
    "Category_Id",
    "Content",
    "Read_Time",
    "Is_Active",
    ...DEFAULT_COL,
  ];
  defaultInfo = { columns: this.col, tablesName: this.tablesName };
  constructor() {}

  getAll() {
    return async (req, res) => {
      const dt: [any, ISettingWeb[]] = await sqlHelper.select({
        columns: this.col,
        tablesName: this.tablesName,
      });
      Promise.all(
        dt[1].map(async (i) => {
          i.modifiedBy = await sqlHelper.getUser(i.modifiedBy)[0];
          i.createdBy = await sqlHelper.getUser(i.modifiedBy)[0];
        })
      );
      const resDt: ResponseData = {
        page: 1,
        total: dt[0][0].total,
        rows: dt[1],
        itemPerPage: dt[0][0].total,
      };
      res.json(resDt);
    };
  }

  getBySlug() {
    return async (req, res) => {
      const slug = req.params.slug;
      const key = ` Slug =  ${db.escape(slug)} `;
      const additionQuery = ` where post.Source_Id = setting_web.Id`;
      const dt: any = await sqlHelper.getPage(
        {
          ...this.defaultInfo,
          columns: [...this.defaultInfo.columns, { id: "Content" }],
          tablesName: `${this.tablesName}`,
          additionTable: "setting_web",
          additionQuery,
          filterQuery: key ? key : undefined,
          orderQuery: `${
            req.query.orderBy ? ` ORDER BY ${req.query.orderBy}` : ""
          }`,
        },
        10,
        1,
        { key: req.query.key }
      );
      await Promise.all(
        dt[1].map(async (i) => {
          i.modifiedBy = (await sqlHelper.getUser(i.modifiedBy))[0];
          i.createdBy = (await sqlHelper.getUser(i.createdBy))[0];
          i.tag = await this.getTagBySlug(i.slug);
        })
      );
      dt[0].modifiedBy = (await sqlHelper.getUser(dt[0].modifiedBy))[0];
      // dt[0].like = (await this.getLike(slug))[0].count;
      dt[0].createdBy = (await sqlHelper.getUser(dt[0].modifiedBy))[0];
      const resDt: any = dt[1][0];
      // resDt.like = (await this.getLike(slug))[0].count;
      //resDt.comment = (await this.getCommentBySlug(slug));
      res.json(resDt);
    };
  }

  getCommentBySlug(slug) {
    const col = [
      { id: "comment.Account", title: "accountComment" },
      { id: "comment.Content", title: "comment" },
      { id: "Parent_Id" },
    ];
    const addQ = ` where user.Account =  comment.Account and ${this.tablesName}.Slug = ?`;
    return sqlHelper.getPer(
      { columns: col, tablesName: "comment", additionQuery: addQ },
      slug,
      " ,user, post "
    );
  }

  getLike(slug) {
    const q = `select count(Id) as count from post_interaction where Post_Status = 'like' and Post_Slug = ?`;
    return getDataFromQuery(q, slug);
  }

  postComment() {
    return async (req, res) => {
      const currentUser = await getUser(req);
      const saveData = {
        Parent_Id: req.body.parentId,
        Post_Slug: req.body.postSlug,
        Content: req.body.content,
        Is_Active: true,
        Account: currentUser,
        Modified_By: currentUser,
        Modified: moment().format("YYYY-MM-DD hh:mm:ss"),
        Created: moment().format("YYYY-MM-DD hh:mm:ss"),
      };
      let q = `insert into comment SET ?`;
      await getDataFromQuery(q, saveData);
      res.status(200).send();
    };
  }

  getDataByUrl() {
    return async (req, res) => {
      var request = require("request");
      request({ uri: req.body.url }, function (error, response, body) {
        res.send({ data: body ? body.toString() : "" });
        res.send({ data: body ? body.toString() : "" });
      });
    };
  }

  getPage() {
    //additionQuery: ` where ${this.tablesName}.Is_Active = true ORDER BY Created desc `
    return async (req, res) => {
      let key = "";
      if (req.query.key) {
        key = `( post.Title like ${db.escape(
          "%" + req.query.key.trim() + "%"
        )} `;
        key += `or post.Summary like ${db.escape(
          "%" + req.query.key.trim() + "%"
        )} `;
        key += req.query.key == "active" ? "or post.Is_Active = 1 " : "";
        key += `or post.Created_By like ${db.escape(
          "%" + req.query.key.trim() + "%"
        )} `;
        key += `or post.Slug like ${db.escape(
          "%" + req.query.key.trim() + "%"
        )} ) `;
      }
      if (req.query.active) {
        if (key) {
          key += " and ";
        }
        key += ` post.Is_Active = 1 `;
      }
      if (req.query.category) {
        if (key) {
          key += " and ";
        }
        key += ` Category_Id =  ${db.escape(req.query.category.trim())} `;
      }
      if (req.query.source) {
        if (key) {
          key += " and ";
        }
        key += ` Source_Id =  ${db.escape(req.query.source.trim())} `;
      }
      if (req.query.orderBy) {
      }
      const limit = req.query.size || 10;
      // page number
      const page = req.query.page || 1;
      // calculate offset
      const additionQuery = ` where post.Source_Id = setting_web.Id`;
      const dt: [any, IPost[]] = await sqlHelper.getPage(
        {
          ...this.defaultInfo,
          tablesName: `${this.tablesName}`,
          additionTable: "setting_web",
          additionQuery,
          filterQuery: key ? key : undefined,
          orderQuery: `${
            req.query.orderBy ? ` ORDER BY ${req.query.orderBy}` : ""
          }`,
        },
        limit,
        page,
        { key: req.query.key }
      );
      await Promise.all(
        dt[1].map(async (i) => {
          i.modifiedBy = (await sqlHelper.getUser(i.modifiedBy))[0];
          i.createdBy = (await sqlHelper.getUser(i.createdBy))[0];
          i.tag = await this.getTagBySlug(i.slug);
        })
      );
      const resDt: ResponseData = {
        page: 1,
        total: dt[0][0].total,
        rows: dt[1],
        itemPerPage: limit,
      };
      res.json(resDt);
    };
  }

  save() {
    return async (req, res) => {
      let id = req.body.id;
      let dataSave: any = {};
      this.colSave.map((key) => {
        if (req.body[toCamelCase(key)]) {
          dataSave[key] = req.body[toCamelCase(key)];
        }
      });
      const url = req.body["url"];

      //check url exist
      const check = await this.getByUrl(url);
      if (check && check.length > 0) {
        res.send("this url is already exist");
        return;
      }
      //
      dataSave.Source_Url = url;
      dataSave.Modified = moment().format("YYYY-MM-DD hh:mm:ss");
      dataSave.Created = moment().format("YYYY-MM-DD hh:mm:ss");
      dataSave.Created_By = await getUser(req);
      dataSave.Modified_By = await getUser(req);
      dataSave.Is_Active = true;
      dataSave.Publish_Date = moment().format("YYYY-MM-DD hh:mm:ss");
      dataSave.Read_Time = Math.floor(req.body.content.length / 20) + 1;
      dataSave.Source_Id = req.body.sourceId; //settingWebId
      dataSave.Slug =
        removeAccents(dataSave.Title) + "-" + new Date().getTime();
      await sqlHelper.save(this.tablesName, _.omit(dataSave, ["Tag"]));
      await Promise.all(
        dataSave.Tag.map(async (tag) => {
          const tagCount = await sqlHelper.getTotalWithQuery(
            { tablesName: "tag", columns: [], additionQuery: " where Tag = ?" },
            tag
          );
          if (tagCount[0].total == 0) {
            await this.saveTag(tag);
          } else {
            await this.saveTag(tag, true);
          }
          await this.deletePostTag(dataSave.Slug);
          await this.savePostTag(dataSave.Slug, tag);
        })
      );
      res.send("");
      return;
    };
  }

  deactive() {
    return async (req, res) => {
      const q = `UPDATE ${this.tablesName} SET Is_Active = false WHERE Slug = ?`;
      await getDataFromQuery(q, req.params.id);
      res.json();
    };
  }

  getByUrl(url) {
    const q = `select * from Post where Source_Url = ?`;
    return getDataFromQuery(q, url);
  }

  getTagBySlug(slug) {
    const q = `select Tag from post_tag where Post_Slug = ?`;
    return getDataFromQuery(q, slug);
  }

  active() {
    return async (req, res) => {
      const q = `UPDATE ${this.tablesName} SET Is_Active = true WHERE Slug = ?`;
      await getDataFromQuery(q, req.params.id);
      res.json();
    };
  }

  saveTag(tag, isUpdate?) {
    let q = `insert into tag SET ?`;
    if (isUpdate) {
      q = `UPDATE tag SET Post_Count = Post_Count + 1 where tag = ?`;
      return getDataFromQuery(q, tag);
    }
    return getDataFromQuery(q, { Tag: tag, Post_Count: 0 });
  }

  deletePostTag(slug) {
    const q = `Delete from post_tag WHERE Post_Slug = ?`;
    return getDataFromQuery(q, slug);
  }

  savePostTag(Post_Slug, Tag) {
    let data = {
      Post_Slug,
      Tag,
    };
    return sqlHelper.save("post_tag", data);
  }

  testCronJob() {
    return async (req, res) => {
      var j = schedule.scheduleJob("1", "*/5 * * * * *", function () {});

      res.status(200).send();
    };
  }

  async savePostByUrl(url, data) {
    //get dt by url
    const html = await this.getContentByUrl(url);

    //
    let dataSave: any = {};
  }

  runJob() {
    return async (req, res) => {
      //this.test();
      const info: {
        id: string;
        jobUrl: string;
        settingPageId: any;
        categoryId: any;
        settingWebId: any;
        rule: {
          maxLength: number;
          minLength: number;
          contain: string;
        };
      } = req.body;
      if (schedule.scheduledJobs[info.id.toString()]) {
        res.status(200).send('done');
        return;
      }
      const _this = this;
     
      var j = schedule.scheduleJob(
        info.id.toString(),
        "*/180 * * * *",
        async function () {
          console.log("running at " + moment().format('MMMM Do YYYY, h:mm:ss a'));
          // get all url
          // const html = await _this.getContentByUrl(info.jobUrl);
          // await $(`#${info.id}`).remove();
          // await $("body").append(`<div id="content"></div>`);
          // await $("body").prepend(`<div id='${info.id}'>${html}</div>`);
          // let listA = $(`#${info.id} a`)
          //   .map(function () {
          //     return $(this).prop("href");
          //   })
          //   .get();
          // if (!info.rule.maxLength) {
          //   info.rule.maxLength = 255;
          // }
          // if (!info.rule.contain) {
          //   info.rule.contain = "";
          // }
          // listA = listA.filter(
          //   (i) =>
          //     i.length >=
          //       (info.rule.minLength || info.rule.contain.length + 5) &&
          //     i.includes("/") &&
          //     i[0] == "/" &&
          //     i.includes(info.rule.contain)
          // );
          // let baseUrl = info.jobUrl.slice(0, info.jobUrl.lastIndexOf("/"));
          // listA = listA.map((i) => baseUrl + i);
          // listA = Array.from(new Set(listA));
          // // res.json(listA);
          // const elements = await getDataFromQuery(
          //   `select Selector as selector, Post_Property as postProperty from setting_element where Setting_Page_Id = ?`,
          //   info.settingPageId
          // );
          // _this.clone(listA, elements, info, req);
          const URL = info.jobUrl;
          const options = {
            uri: URL,
            transform: function (body) {
              return cheerio.load(body);
            },
          };

          var $ = await rp(options);
          let listA = $(`a`)
            .map(function () {
              return $(this).prop("href");
            })
            .get();

          if (!info.rule.maxLength) {
            info.rule.maxLength = 255;
          }
          if (!info.rule.contain) {
            info.rule.contain = "";
          }
          listA = listA.filter(
            (i) =>
              i.length >=
                (info.rule.minLength || info.rule.contain.length + 5) &&
              i.includes("/") &&
              i[0] == "/" &&
              i.includes(info.rule.contain)
          );
          let baseUrl = info.jobUrl.slice(0, info.jobUrl.lastIndexOf("/"));
          listA = listA.map((i) => baseUrl + i);
          listA = Array.from(new Set(listA));
          const elements = await getDataFromQuery(
            `select Selector as selector, Post_Property as postProperty from setting_element where Setting_Page_Id = ?`,
            info.settingPageId
          );
          for (let i = 0; i < listA.length; i++) { 
            let url = listA[i]
            const op = {
              uri: url,
              transform: function (body) {
                return cheerio.load(body);
              },
            };
            try {
              let $ = await rp(op);
              let dataSave = {};
              elements.map((e) => {
                dataSave = { ...dataSave, ..._this.parseDataPlus(e, $) };
              });
              dataSave["sourceUrl"] = url;
              dataSave["sourceId"] = info.settingWebId;
              dataSave["categoryId"] = info.categoryId;
              await _this.saveArticle(dataSave, req);
            } catch (error) {
              continue;
            } 
          }
        }
      );
      res.status(200).send();
    };
  }

  async clone(listA, elements, info, req) {
    for (let i = 0; i < listA.length; i++) {
      $("#content").empty();
      let content = await this.getContentByUrl(listA[i]);
      $("#content").append(content);
      let dataSave = {};

      elements.map((e) => {
        dataSave = { ...dataSave, ...this.parseData(e) };
      });

      dataSave["sourceUrl"] = listA[i];
      dataSave["sourceId"] = info.settingWebId;
      dataSave["categoryId"] = info.categoryId;
      await this.saveArticle(dataSave, req);
    }
  }

  parseDataPlus(data, jq) {
    const dataSave = {};
    dataSave[data.postProperty] =
      data.postProperty === "content"
        ? jq(data.selector).html()
        : jq(data.selector).text();
    dataSave[data.postProperty] = dataSave[data.postProperty] || "";
    dataSave[data.postProperty] = dataSave[data.postProperty].trim();
    if (data.postProperty === "avatar") {
      let avatarUrl = jq(data.selector).attr("src");
      dataSave[data.postProperty] = avatarUrl;
    }
    if (!dataSave[data.postProperty]) {
      return;
    }
    return dataSave;
  }

  parseData(data) {
    const dataSave = {};
    dataSave[data.postProperty] =
      data.postProperty === "content"
        ? $(data.selector).html()
        : $(data.selector).text();
    dataSave[data.postProperty] = dataSave[data.postProperty] || "";
    dataSave[data.postProperty] = dataSave[data.postProperty].trim();
    if (data.postProperty === "avatar") {
      dataSave[data.postProperty] = _.get($(data.selector)[0], "src", "");
    }
    if (!dataSave[data.postProperty]) {
      return;
    }
    return dataSave;
  }

  async saveArticle(data, req) {
    if (!data.avatar) {
      return Promise.resolve("");
    }
    let dataSave: any = {};
    this.colSave.map((key) => {
      if (data[toCamelCase(key)]) {
        dataSave[key] = data[toCamelCase(key)];
      }
    });
    const url = data["sourceUrl"];
    //check url exist
    const check = await this.getByUrl(url);
    if (check && check.length > 0) {
      return Promise.resolve("");
    }
    if (!data.title) {
      return Promise.resolve("");
    }
    //
    dataSave.Source_Url = url;
    dataSave.Modified = moment().format("YYYY-MM-DD hh:mm:ss");
    dataSave.Created = moment().format("YYYY-MM-DD hh:mm:ss");
    dataSave.Created_By = await getUser(req);
    dataSave.Modified_By = await getUser(req);
    dataSave.Is_Active = true;
    dataSave.Publish_Date = moment().format("YYYY-MM-DD hh:mm:ss");
    dataSave.Read_Time = Math.floor(data.content.length / 20) + 1;
    dataSave.Source_Id = data["sourceId"]; //settingWebId
    dataSave.Slug = removeAccents(data.title) + "-" + new Date().getTime();
    return sqlHelper.save(this.tablesName, _.omit(dataSave, ["Tag"]));
  }

  getContentByUrl(url) {
    return new Promise((resolve, reject) => {
      var request = require("request");
      request({ uri: url }, function (error, response, body) {
        resolve(body ? body.toString() : "");
      });
    });
  }

  test() {
    $("body").append(`<h3 class='abc'> tieesbt hành tét</h3>`);
  }

  getCronJob() {
    return async (req, res) => {
      const listJob = schedule.scheduledJobs;
      res.status(200).json(listJob);
    };
  }

  stopJob() {
    return async (req, res) => {
      const id = req.body.id;
      const listJob = schedule.scheduledJobs;
      if (!listJob[id.toString()]) {
        res.status(200).json();
        return;
      }
      listJob[id.toString()].cancel();
      res.status(200).json();
    };
  }
}
export const post = new postController();

export interface ResponseData {
  page: number;
  total: number;
  itemPerPage: number;
  rows: any[];
}
