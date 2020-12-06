import { join } from 'path';
import { getDataFromQuery, getUser, toCamelCase } from '../common';
import { ISettingWeb } from '../models/SettingWeb';
import { dbColunm, DEFAULT_COL, sqlHelper } from '../common';
import * as _ from 'lodash'
import moment from 'moment';
import { ISettingPage } from '../models/SettingPage';

class settingJobController {
  tablesName = 'setting_job'
  col: dbColunm[] = [
    {
      id: 'setting_job.Title',
      title: 'title'
    },
    {
      id: 'Job_Url',
    },
    {
      id: 'Setting_Page_Id',
    },
    {
      id: 'setting_page.Title',
      title: 'settingPage'
    },
    {
      id: 'setting_web.Id',
      title: 'settingWebId'
    },
    {
      id: 'Category_Id',
    },
    {
      id: 'Category.Title',
      title: 'category'
    },
    {
      id: 'Rule'
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
  colSave = ['Title', 'Setting_Page_Id' , 'Job_Url','Rule']
  defaultInfo = {columns: this.col, tablesName:this.tablesName};
  constructor() {

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
      if(id) {
        delete dataSave.Created;
        delete dataSave.Created_By;
        dataSave.id = id;
      }
      const rs = await sqlHelper.save(this.tablesName, dataSave)
      res.json(rs)
    }
  }

  getPage() {
    return async (req, res) => { 
      let limit = req.query.size || 10;
      limit = 100;
      // page number
      const page = req.query.page || 1;
      // calculate offset
      const dt: [any, ISettingWeb[]] = await sqlHelper.getPage({...this.defaultInfo, removeDefaultColumn: true ,
        additionTable: ' setting_page, category, setting_web ',
        additionQuery: `where setting_page.Id = ${this.tablesName}.Setting_Page_Id 
                  and setting_page.Web_Id = setting_web.Id
                  and setting_page.Category_Id = category.Id ORDER BY Title desc `}, limit, page);
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
      const q = `Delete from ${this.tablesName} WHERE Id = ?`;
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
export const settingJob= new settingJobController();

export interface ResponseData {
  page: number,
  total: number,
  itemPerPage: number,
  rows: any[] 
}