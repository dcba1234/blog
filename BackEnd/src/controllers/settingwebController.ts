import { ISettingWeb } from './../models/SettingWeb';
import { dbColunm, sqlHelper } from '../common';


class settingwebController {
  tablesName = 'setting_web'
  col: dbColunm[] = [
    {
      id: 'Title',
    },
    {
      id: 'Url',
    },
    {
      id: 'Note',
    },
    {
      id: 'Select_Mode',
    },
  ]
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

  getPage() {
    return async (req, res) => { 
      const limit = req.query.size || 10;
      // page number
      const page = req.query.page || 1;
      // calculate offset
      console.log('limit',limit);
      
      const dt: [any, ISettingWeb[]] = await sqlHelper.getPage(this.defaultInfo, limit, page);
      Promise.all(dt[1].map(async (i) => {
        i.modifiedBy = await sqlHelper.getUser(i.modifiedBy)[0];
        i.createdBy = await sqlHelper.getUser(i.modifiedBy)[0];
      }))
      res.json(dt)
    }
  }


}
export const settingWeb = new settingwebController();

export interface ResponseData {
  page: number,
  total: number,
  itemPerPage: number,
  rows: any[] 
}