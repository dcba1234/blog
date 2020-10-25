import { join } from 'path';
import { getDataFromQuery, getUser, toCamelCase } from '../common';
import { ISettingWeb } from '../models/SettingWeb';
import { dbColunm, DEFAULT_COL, sqlHelper } from '../common';
import * as _ from 'lodash'
import moment from 'moment';
import { ISettingPage } from '../models/SettingPage';

class settingPageController {
  tablesName = 'setting_page'
  col: dbColunm[] = [
    {
      id: 'Title',
    },
    {
      id: 'Url',
    },
    {
      id: 'Web_Id'
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
  colSave = ['Title', 'Url', 'Web_Id', 'Is_Active' , ...DEFAULT_COL]
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

  getById() {
    return async (req, res) => { 
      const webId = req.params.id;
      console.log(webId);
      
      const dt: [any, ISettingWeb[]] = 
                          await sqlHelper.getPer({columns: this.col, tablesName:this.tablesName,
                         additionQuery:` where ${this.tablesName}.Id = ? and ${this.tablesName}.Is_Active`}, webId);
        dt[0].modifiedBy = await sqlHelper.getUser(dt[0].modifiedBy)[0];
        dt[0].createdBy = await sqlHelper.getUser(dt[0].modifiedBy)[0];
        const elements = await getDataFromQuery(`select Selector as selector, Post_Property as postProperty from setting_element where Setting_Page_Id = ?`, webId);
        dt[0].elements = elements;
      const resDt: ISettingPage = dt[0] as unknown as ISettingPage;
      res.json(resDt)
    }
  }

  getDataByUrl() {
    return async (req, res) => {
      var request = require("request");
      request(
        { uri: req.body.url },
        function(error, response, body) {
          res.send({ data: body? body.toString() : ''})
        }
      );
    }
  }

  save() {
    return async (req, res) => { 
      let id = req.body.id;
      let dataSave: any = {}
      this.colSave.map((key) => {
        if(req.body[toCamelCase(key)]) {
          dataSave[key] = req.body[toCamelCase(key)];
        }   
      })
      dataSave.Modified = moment().format('YYYY-MM-DD hh:mm:ss');
      dataSave.Created = moment().format('YYYY-MM-DD hh:mm:ss');
      dataSave.Created_By = getUser();
      dataSave.Modified_By = getUser();
      dataSave.Is_Active = true;
      if(id) {
        delete dataSave.Created;
        delete dataSave.Created_By;
        dataSave.id = id;
      }
      if(req.body['elements']) {
        await Promise.all(req.body['elements'].map(async (e) => {
          await this.deleteElement(req.body.id);
          const elementSave = {...e};
          elementSave.Setting_Page_Id = req.body.id;
          sqlHelper.save('setting_element', {
            Selector: elementSave.selector,
            Post_Property: elementSave.postProperty,
            Setting_Page_Id: id,
            Is_Active: true
          });
        }))
      }
      const rs = await sqlHelper.save(this.tablesName, dataSave)
      res.json(rs)
    }
  }

  getPage() {
    return async (req, res) => { 
      const limit = req.query.size || 10;
      // page number
      const page = req.query.page || 1;
      // calculate offset
      const webId = req.params.id;
      if(isNaN(webId)) {
        return ({
          page: 1,
          total: 0,
          rows: [],
          itemPerPage: 0,
        })
      }
      const q = ' where we'
      const dt: [any, ISettingWeb[]] = await sqlHelper.getPage({...this.defaultInfo, 
        additionQuery: ` where Web_Id = ? and ${this.tablesName}.Is_Active = true ORDER BY Created desc `}, limit, page, webId);
      Promise.all(dt[1].map(async (i) => {
        i.modifiedBy = await sqlHelper.getUser(i.modifiedBy)[0];
        i.createdBy = await sqlHelper.getUser(i.modifiedBy)[0];
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

  delete() {
    return async (req, res) => {
      const q = `UPDATE ${this.tablesName} SET Is_Active = false WHERE Id = ?`;
      console.log(q);
      await getDataFromQuery(q, req.params.id)
      res.json();
    }
  }

  async deleteElement(id) {
      const q = `Delete from setting_element WHERE Setting_Page_Id = ?`;
      console.log(q);
      
      await getDataFromQuery(q, id);
  }


}
export const settingPage = new settingPageController();

export interface ResponseData {
  page: number,
  total: number,
  itemPerPage: number,
  rows: any[] 
}