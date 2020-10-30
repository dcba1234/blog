import { tag } from './TagController';
import { join } from 'path';
import { getDataFromQuery, getUser, removeAccents, toCamelCase } from '../common';
import { ISettingWeb } from '../models/SettingWeb';
import { dbColunm, DEFAULT_COL, sqlHelper } from '../common';
import * as _ from 'lodash'
import moment from 'moment';
import { ISettingPage } from '../models/SettingPage';
import { db } from '../db';
import { IPost } from '../models/Post';

class postController {
  tablesName = 'post'
  col: dbColunm[] = [
    {
      id: 'post.Title',
      title: 'title'
    },
    {
      id: 'Slug'
    },
    {
      id: 'Source_Id'
    },
    {
      id: 'Category_Id'
    },
    {
      id: 'Summary'
    },
    {
      id: 'Avatar'
    },
    {
      id: 'Publish_Date'
    },
    {
      id: 'setting_web.Title',
      title: 'source'
    },
    {
      id: 'setting_web.Id',
      title: 'settingWebId'
    }
  ]
  colElement: dbColunm[] = [
    {
      id: 'Title',
    },
    {
      id: 'Post_Property',
    },
    {
      id: 'Selector'
    }
  ]
  colSave = ['Title', 'Avatar' ,'Slug', 'Tag', 'Source_Id','Summary','Publish_Date','Category_Id','Content','Read_Time', 'Is_Active' , ...DEFAULT_COL]
  defaultInfo = {columns: this.col, tablesName:this.tablesName};
  constructor() {

  }

  getAll() {
    return async (req, res) => { 
      const dt: [any, ISettingWeb[]] = await sqlHelper.select({columns: this.col, tablesName:this.tablesName});
      Promise.all(dt[1].map(async (i) => {
        i.modifiedBy = await sqlHelper.getUser(i.modifiedBy)[0];
        i.createdBy = await sqlHelper.getUser(i.modifiedBy)[0];
      }))
      const resDt:ResponseData = {
        page: 1,
        total: dt[0][0].total,
        rows: dt[1],
        itemPerPage: dt[0][0].total
      }
      res.json(resDt)
    }
  }

  getBySlug() {
    return async (req, res) => { 
      const slug = req.params.slug;
      const key  = ` Slug =  ${db.escape(slug)} `
      const additionQuery = ` where post.Source_Id = setting_web.Id` ;
      const dt: any = await sqlHelper.getPage(
        {...this.defaultInfo, columns: [...this.defaultInfo.columns, { id: 'Content' }], tablesName:`${this.tablesName}`,
         additionTable: 'setting_web', additionQuery,
         filterQuery: key? key : undefined,
         orderQuery: `${req.query.orderBy? ` ORDER BY ${req.query.orderBy}` : ''}`
        }
        , 10, 1, {key: req.query.key});
      await Promise.all(dt[1].map(async (i) => {
        i.modifiedBy = (await sqlHelper.getUser(i.modifiedBy))[0];
        i.createdBy = (await sqlHelper.getUser(i.createdBy))[0];
        i.tag = (await this.getTagBySlug(i.slug));
      }))
        dt[0].modifiedBy = (await sqlHelper.getUser(dt[0].modifiedBy))[0];
        dt[0].like = (await this.getLike(slug))[0].count;
        dt[0].createdBy = (await sqlHelper.getUser(dt[0].modifiedBy))[0];
      const resDt: any = dt[1][0];
      resDt.like = (await this.getLike(slug))[0].count;
      resDt.comment = (await this.getCommentBySlug(slug));
      res.json(resDt)
    }
  }

  getCommentBySlug(slug) {
    const col = [{ id: 'comment.Account',title: 'accountComment'  },{ id: 'comment.Content', title: 'comment' },{ id: 'Parent_Id' }]
    const addQ = ` where user.Account =  comment.Account and ${this.tablesName}.Slug = ?`
    return sqlHelper.getPer({columns: col, tablesName:'comment',
      additionQuery: addQ}, slug, ' ,user, post '); 
  }

  getLike(slug) {
    const q = `select count(Id) as count from post_interaction where Post_Status = 'like' and Post_Slug = ?`
    return getDataFromQuery(q, slug)
  }

  getDataByUrl() {
    return async (req, res) => {
      var request = require("request");
      request(
        { uri: req.body.url },
        function(error, response, body) {
          res.send({ data: body? body.toString() : ''})
          res.send({ data: body? body.toString() : ''})
        }
      );
    }
  }

  getPage() {
    //additionQuery: ` where ${this.tablesName}.Is_Active = true ORDER BY Created desc `
    return async (req, res) => { 
      console.log(req.query);
      let key = '';
      if(req.query.key) {
        key = `( post.Title like ${db.escape('%'+req.query.key.trim()+'%')} `
        key += `or post.Summary like ${db.escape('%'+req.query.key.trim()+'%')} `
        key += req.query.key == 'active'? 'or post.Is_Active = 1 ' : ''
        key += `or post.Created_By like ${db.escape('%'+req.query.key.trim()+'%')} `
        key += `or post.Slug like ${db.escape('%'+req.query.key.trim()+'%')} ) `
      }
      if(req.query.active) {
        if(key) {
          key += ' and '
        }
        key += ` post.Is_Active = 1 `
      }
      if(req.query.category) {
        if(key) {
          key += ' and '
        }
        key += ` Category_Id =  ${db.escape(req.query.category.trim())} `
      }
      if(req.query.source) {
        if(key) {
          key += ' and '
        }
        key += ` Source_Id =  ${db.escape(req.query.source.trim())} `
      }
      if(req.query.orderBy) {
        
      }
      const limit = req.query.size || 10;
      // page number
      const page = req.query.page || 1;
      // calculate offset
      const additionQuery = ` where post.Source_Id = setting_web.Id` ;
      const dt: [any, IPost[]] = await sqlHelper.getPage(
        {...this.defaultInfo, tablesName:`${this.tablesName}`,
         additionTable: 'setting_web', additionQuery,
         filterQuery: key? key : undefined,
         orderQuery: `${req.query.orderBy? ` ORDER BY ${req.query.orderBy}` : ''}`
        }
        , limit, page, {key: req.query.key});
      await Promise.all(dt[1].map(async (i) => {
        i.modifiedBy = (await sqlHelper.getUser(i.modifiedBy))[0];
        i.createdBy = (await sqlHelper.getUser(i.createdBy))[0];
        i.tag = (await this.getTagBySlug(i.slug));
      }))
      const resDt:ResponseData = {
        page: 1,
        total: dt[0][0].total,
        rows: dt[1],
        itemPerPage: limit
      }
      res.json(resDt)
    }
  }

  save() {
    return async (req, res) => { 
      console.log('article save');
      
      let id = req.body.id;
      let dataSave: any = {}
      this.colSave.map((key) => {
        if(req.body[toCamelCase(key)]) {
          dataSave[key] = req.body[toCamelCase(key)];
        }   
      })
      dataSave.Modified = moment().format('YYYY-MM-DD hh:mm:ss');
      dataSave.Created = moment().format('YYYY-MM-DD hh:mm:ss');
      dataSave.Created_By = getUser(req);
      dataSave.Modified_By = getUser(req);
      dataSave.Is_Active = true;
      dataSave.Publish_Date = moment().format('YYYY-MM-DD hh:mm:ss');
      dataSave.Read_Time = Math.floor(req.body.content.length /20) + 1;
      dataSave.Source_Id = req.body.sourceId;
      dataSave.Slug = removeAccents(dataSave.Title) + '-' + new Date().getTime();
      //console.log(dataSave);
      await sqlHelper.save(this.tablesName, _.omit(dataSave, ['Tag']));
      await Promise.all(dataSave.Tag.map(async (tag) => {
        const tagCount = await sqlHelper.getTotalWithQuery({ tablesName: 'tag' , columns: [], additionQuery: ' where Tag = ?'}, tag)
        if(tagCount[0].total == 0) {
          await this.saveTag(tag);
        } else {
          await this.saveTag(tag, true);
        }
        await this.deletePostTag(dataSave.Slug);
        await this.savePostTag(dataSave.Slug, tag);
      }));
      res.send('')
      return;
    }
  }

  

  deactive() {
    return async (req, res) => {
      const q = `UPDATE ${this.tablesName} SET Is_Active = false WHERE Slug = ?`;
      console.log(q);
      await getDataFromQuery(q, req.params.id)
      res.json();
    }
  }

  getTagBySlug(slug) {
    const q = `select Tag from post_tag where Post_Slug = ?`;
    return getDataFromQuery(q, slug)
  }

  active() {
    return async (req, res) => {
      const q = `UPDATE ${this.tablesName} SET Is_Active = true WHERE Slug = ?`;
      console.log(q);
      await getDataFromQuery(q, req.params.id)
      res.json();
    }
  }

  saveTag(tag, isUpdate?) {
    console.log(isUpdate);
    
    let q = `insert into tag SET ?`;
    if(isUpdate) {
      q = `UPDATE tag SET Post_Count = Post_Count + 1 where tag = ?`;
      return getDataFromQuery(q, tag);
    }
    return getDataFromQuery(q, {Tag: tag,  Post_Count: 0});
  }

  deletePostTag(slug) {
      const q = `Delete from post_tag WHERE Post_Slug = ?`;
      return getDataFromQuery(q, slug);
  }

  savePostTag(Post_Slug, Tag) {
    let data = {
      Post_Slug, Tag
    }
    return sqlHelper.save('post_tag', data)
  }


}
export const post = new postController();

export interface ResponseData {
  page: number,
  total: number,
  itemPerPage: number,
  rows: any[] 
}