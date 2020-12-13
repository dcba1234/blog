import { getUser } from '../common';
import { ISettingWeb } from '../models/SettingWeb';
import { dbColunm, DEFAULT_COL, getDataFromQuery, sqlHelper, toCamelCase } from '../common';
import moment from 'moment';
import { db } from '../db';


class DashboardController {
  tablesName = 'user'
  col: dbColunm[] = [
    {
      id: 'Account',
    },
    {
      id: 'First_Name',
    },
    {
      id: 'Last_Name',
    },
    {
      id: 'Email',
    },
    {
      id: 'Date_Of_Birth',
    },
  ]
  colSave = ['Title', 'Is_Active' , ...DEFAULT_COL]
  defaultInfo = {columns: this.col, tablesName:this.tablesName};
  constructor() {

  }

  getAll() {
    return async (req, res) => { 
      const currentMonth = moment().month() + 1;
      
      let result = {};
      const articleResourceQ = `select count(*) as count from setting_web where Is_Active = 1`;
      const articlesQ = `select count(*) as count from post where Is_Active = 1`;
      const reportsQ = `SELECT Post_Slug FROM post_interaction, post where Is_Report = 1 and post_interaction.Post_Slug = post.Slug and post.Is_Active = 1 GROUP by Post_Slug`;
      const usersQ = `SELECT count(*) as count from user where user.Role <> 'Admin'`;

      const articleResource = (await getDataFromQuery(articleResourceQ))[0].count;
      const articles = (await getDataFromQuery(articlesQ))[0].count;
      const reports = (await getDataFromQuery(reportsQ)).length;
      const users = (await getDataFromQuery(usersQ))[0].count;
      const dateDt = [];
      const dates = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
      await Promise.all(dates.map( async (d, index) => {
        let q = `SELECT COUNT(*) as count FROM post_interaction WHERE Is_Report <> 1 and YEAR(post_interaction.Created) = '${moment().year()}' and MONTH(post_interaction.Created) = ${index+1}`;
        let result = (await getDataFromQuery(q))[0].count;
        dateDt.push(result);
      }))

      res.json({ articleResource, articles, reports, users, date: dateDt  })
    }
  }

  getPage() {//  additionQuery: ` where ${this.tablesName}.Is_Active = true`,
    return async (req, res) => { 
      let key = ``;
      if(req.query.key) {
        key = `and ( ${this.tablesName}.Account like ${db.escape('%'+req.query.key.trim()+'%')} `
        key += `or ${this.tablesName}.Email like ${db.escape('%'+req.query.key.trim()+'%')} `
        key += `or ${this.tablesName}.First_Name like ${db.escape('%'+req.query.key.trim()+'%')} `
        key += `or ${this.tablesName}.Last_Name like ${db.escape('%'+req.query.key.trim()+'%')} `
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
      dataSave.Created_By = await getUser(req);
      dataSave.Modified_By = await  getUser(req);
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
      const q = `UPDATE ${this.tablesName} SET Is_Active = false WHERE Account = ?`;
      await getDataFromQuery(q, req.params.id)
      res.json();
    }
  }

  deactive() {
    return async (req, res) => {
      const q = `UPDATE ${this.tablesName} SET Is_Active = false WHERE Account = ?`;
      await getDataFromQuery(q, req.params.id)
      res.json();
    }
  }

  active() {
    return async (req, res) => {
      const q = `UPDATE ${this.tablesName} SET Is_Active = true WHERE Account = ?`;
      await getDataFromQuery(q, req.params.id)
      res.json();
    }
  }


}
export const dashboard = new DashboardController();

export interface ResponseData {
  page: number,
  total: number,
  itemPerPage: number,
  rows: any[] 
}