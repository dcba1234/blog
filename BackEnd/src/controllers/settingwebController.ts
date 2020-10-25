import { ISettingWeb } from './../models/SettingWeb';
import { dbColunm, DEFAULT_COL, getUser, sqlHelper, toCamelCase } from '../common';
import moment from 'moment';
import { db } from '../db';


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
  colSave = ['Title','Url', 'Note' ,  'Is_Active' , ...DEFAULT_COL]
  constructor() {

  }

  getAll() {
    return async (req, res) => { 
      let key = '';
      if(req.query.key) {
        key = `( ${this.tablesName}.Title like ${db.escape('%'+req.query.key.trim()+'%')} `
        key += `or ${this.tablesName}.Note like ${db.escape('%'+req.query.key.trim()+'%')} `
        key += `or ${this.tablesName}.Created = ${db.escape(req.query.key.trim())} ) `
        //key += `or ${this.tablesName}.Created like ${db.escape('%'+req.query.key.trim()+'%')} ) `
      }
      const dt: [any, ISettingWeb[]] = await sqlHelper.select({columns: this.col, tablesName:this.tablesName, filterQuery: key? key : undefined});
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
      let key = '';
      if(req.query.key) {
        key = `( ${this.tablesName}.Title like ${db.escape('%'+req.query.key.trim()+'%')} `
        key += `or ${this.tablesName}.Id like ${db.escape('%'+req.query.key.trim()+'%')} `
        key += `or ${this.tablesName}.Created_By like ${db.escape('%'+req.query.key.trim()+'%')} `
        key += `or ${this.tablesName}.Created = ${db.escape(req.query.key.trim())} ) `
        //key += `or ${this.tablesName}.Created like ${db.escape('%'+req.query.key.trim()+'%')} ) `
      }
      const limit = req.query.size || 10;
      // page number
      const page = req.query.page || 1;
      // calculate offset
      console.log('limit',limit);
      
      const dt: [any, ISettingWeb[]] = await sqlHelper.getPage(
        {...this.defaultInfo,  filterQuery: key? key : undefined,}
        , limit, page);
      Promise.all(dt[1].map(async (i) => {
        i.modifiedBy = await sqlHelper.getUser(i.modifiedBy)[0];
        i.createdBy = await sqlHelper.getUser(i.modifiedBy)[0];
      }))
      res.json(dt)
    }
  }

  save() {
    return async (req, res) => { 
      let id = req.body.id;
      let dataSave: any = {}
      this.colSave.map((key) => {
        dataSave[key] = req.body[toCamelCase(key)];
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
      const rs = await sqlHelper.save(this.tablesName, dataSave)
      res.json(rs)
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