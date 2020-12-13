import { ISettingWeb } from '../models/SettingWeb';
import { dbColunm, DEFAULT_COL, getDataFromQuery, sqlHelper, toCamelCase } from '../common';
import moment from 'moment';
import { db } from '../db';


class CategoryController {
  tablesName = 'category'
  col: dbColunm[] = [
    {
      id: 'Title',
    },
  ]
  colSave = ['Title', 'Is_Active' , ...DEFAULT_COL]
  defaultInfo = {columns: this.col, tablesName:this.tablesName};
  constructor() {

  }

  getAll() {
    return async (req, res) => { 
      const dt: [any, ISettingWeb[]] = await sqlHelper.select({columns: this.col, tablesName:this.tablesName, additionQuery: ` where ${this.tablesName}.Is_Active = 1 `});
      Promise.all(dt[1].map(async (i) => {
        i.modifiedBy = await sqlHelper.getUser(i.modifiedBy)[0];
        i.createdBy = await sqlHelper.getUser(i.modifiedBy)[0];
      }))
      res.json(dt[1])
    }
  }

  getPage() {//  additionQuery: ` where ${this.tablesName}.Is_Active = true`,
    return async (req, res) => { 
      let key = '';
      if(req.query.key) {
        key = `( ${this.tablesName}.Title like ${db.escape('%'+req.query.key.trim()+'%')} `
        key += `or ${this.tablesName}.Created_By like ${db.escape('%'+req.query.key.trim()+'%')} `
        key += `or ${this.tablesName}.Id like ${db.escape('%'+req.query.key.trim()+'%')} `
        key += `or ${this.tablesName}.Created = ${db.escape(req.query.key.trim())} ) `
        //key += `or ${this.tablesName}.Created like ${db.escape('%'+req.query.key.trim()+'%')} ) `
      }
      if(req.query.orderBy) {
        
      }
      const limit = req.query.size || 10;
      // page number
      const page = req.query.page || 1;
      // calculate offset
      const dt: [any, ISettingWeb[]] = await sqlHelper.getPage({...this.defaultInfo, 
      
        filterQuery: key? key : undefined,
        orderQuery: `${req.query.orderBy? ` ORDER BY ${req.query.orderBy}` : ''}`
       }, limit, page);
        
      await Promise.all(dt[1].map(async (i) => {
        i.modifiedBy = (await sqlHelper.getUser(i.modifiedBy))[0];
        i.createdBy = (await sqlHelper.getUser(i.createdBy))[0];
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
      let id = req.body.id;
      let dataSave: any = {}
      this.colSave.map((key) => {
        dataSave[key] = req.body[toCamelCase(key)];
      })
      dataSave.Modified = moment().format('YYYY-MM-DD hh:mm:ss');
      dataSave.Created = moment().format('YYYY-MM-DD hh:mm:ss');
      dataSave.Created_By = 'thanhnnt';
      dataSave.Modified_By = 'thanhnnt';
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

  delete() {
    return async (req, res) => {
      const q = `UPDATE ${this.tablesName} SET Is_Active = false WHERE Id = ?`; 
      await getDataFromQuery(q, req.params.id)
      res.json();
    }
  }

  deactive() {
    return async (req, res) => {
      const q = `UPDATE ${this.tablesName} SET Is_Active = false WHERE Id = ?`;
      await getDataFromQuery(q, req.params.id)
      res.json();
    }
  }

  active() {
    return async (req, res) => {
      const q = `UPDATE ${this.tablesName} SET Is_Active = true WHERE Id = ?`;
      await getDataFromQuery(q, req.params.id)
      res.json();
    }
  }


}
export const category = new CategoryController();

export interface ResponseData {
  page: number,
  total: number,
  itemPerPage: number,
  rows: any[] 
}