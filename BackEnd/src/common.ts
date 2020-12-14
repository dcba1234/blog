import * as _ from "lodash";
import { join } from "path";
import { db } from "./db";
import * as moment from 'moment'
import { verifyToken } from "./helper/jwt.helper";
import { refreshTokenSecret } from "./helper/AuthMiddleware";
import { log } from "console";
class SqlHelper {
  table = "";
  constructor() {}

  async select(info: sqlHelperInfo, data?: any): Promise<any> {
    let q = `select ${info.tablesName}.Id as id, ${genSelectQuery(
      info.columns
    )} ${
      info.removeDefaultColumn ? "" : defaultColumns(info.tablesName)
    } from ${info.tablesName}`;
    q += info.additionQuery? info.additionQuery : '';
    if(info.filterQuery) {
      if(info.additionQuery) {
        q += ' and ';     
      } else {
        q += ' where '
      }
      q += info.filterQuery;
    }
    return Promise.all([this.getTotal(info), getDataFromQuery(q, data)])
  }

  async getPer(info: sqlHelperInfo, data?: any, user?): Promise<any> {
    let q = `select ${info.tablesName}.Id as id, ${genSelectQuery(
      info.columns
    )} ${
      info.removeDefaultColumn ? "" : defaultColumns(info.tablesName)
    } from ${info.tablesName}`;
       q += user? user : ''
       q += info.additionQuery? info.additionQuery : '';

    return getDataFromQuery(q, data)
  }

  async save(tableName, data, account?): Promise<any> { //'2020-10-22 16:16:22'
    let q = `INSERT INTO ${tableName} SET ?`;
    if(data.id) {
      q = `UPDATE ${tableName} SET ? WHERE ${account? 'Account' : 'Id'} = ?`;
      let id = data.id;
      delete data.id
      return getDataFromQuery(q,data, id);
    }
    return getDataFromQuery(q,data);
  }

  /**
  *  @table table1,table2
 */
  async getPage(info: sqlHelperInfo, limit: number, page: number, data?): Promise<any> {
    // calculate offset
    const offset = (page - 1) * limit;
    // query for fetching data with page number and offset
    let q = `select ${info.tablesName}.Id as id, ${genSelectQuery(
      info.columns
    )} ${
      info.removeDefaultColumn ? "" : defaultColumns(info.tablesName.split(',')[0])
    } from ${info.tablesName} ${info.additionTable? `,${info.additionTable}` : '' }`; // table 1,b
      q += info.additionQuery? info.additionQuery : '';
      if(info.filterQuery) {
        if(info.additionQuery) {
          q += ' and ';     
        } else {
          q += ' where '
        }
        q += info.filterQuery;
      }
      if(info.groupBy) {
        q += ` group by ${info.groupBy} `
      }
      if(info.orderQuery) {
        q += info.orderQuery;
      }
      q += " limit " + limit + " OFFSET " + offset;
    return Promise.all([this.getTotal(info, data), getDataFromQuery(q, data)])
  }

  delete(info: sqlHelperInfo) {
    let q = `select count(*) as total from ${info.tablesName}`;
    q += info.additionQuery? info.additionQuery : '';
    return getDataFromQuery(q)
  }
  

  getTotal(info: sqlHelperInfo, data?) {
    let q = `select count(*) as total from ${info.tablesName}`;
    q += info.filterQuery? ' where' + info.filterQuery : '';
    return getDataFromQuery(q, data)
  }

  getTotalWithQuery(info: sqlHelperInfo, data?) {
    let q = `select count(*) as total from ${info.tablesName}`;
    q += info.additionQuery? info.additionQuery : '';
    return getDataFromQuery(q, data)
  }

  async getUserValidate(account: any, password): Promise<any> {
    if(!account) return [];
    if(!password) return [];
    const col = [
      {
        id: "Account",
      },
      {
        id: "First_Name",
      },
      {
        id: "Last_Name",
      },
      {
        id: "Email",
      },
      {
        id: "Date_Of_Birth",
      },
      {
        id: "Introduce",
      },
      {
        id: "Avatar",
      },
      {
        id: "Role",
      },
      {
        id: "Last_Login",
      },
    ];
    let q = `select ${genSelectQuery(
      col
    )}, master_country.Id as countryId, master_country.Title as country,
     master_gender.Id as genderId, master_gender.Title as gender FROM user 
     left join master_gender on master_gender.Id = user.Gender_Id 
     left join master_country on master_country.Id = user.Country_Id 
     where Account = ?`;
    //  user.Gender_Id = master_gender.Id and user.Country_Id = master_country.Id and
     if(password) {
      q += ` and Password = ? `
     }

    return getDataFromQuery(q, account, password);
  }

  async getUser(account: any, password?): Promise<any> {
    if(!account) return {};
    const col = [
      {
        id: "Account",
      },
      {
        id: "First_Name",
      },
      {
        id: "Last_Name",
      },
      {
        id: "Email",
      },
      {
        id: "Date_Of_Birth",
      },
      {
        id: "Introduce",
      },
      {
        id: "Avatar",
      },
      {
        id: "Role",
      },
      {
        id: "Last_Login",
      },
    ];
    let q = `select ${genSelectQuery(
      col
    )}, master_country.Id as countryId, master_country.Title as country,
     master_gender.Id as genderId, master_gender.Title as gender FROM user, master_gender, master_country 
     where user.Gender_Id = master_gender.Id and user.Country_Id = master_country.Id and Account = ?`;
     
     if(password) {
      q += ` and Password = ? `
     }
     
    return getDataFromQuery(q, account, password);
  }
}



export const getDataFromQuery: any = async (query: string, data?, Id?) =>
  new Promise((resolve, reject) => {
    console.log(query)
    let sql = query;
    db.query(sql, [data, Id], (err, response) => {
      if (err) {
        throw err;
        return { error: "error" };
      }
      resolve(response);
    });
  });



export const sqlHelper = new SqlHelper();

export interface dbColunm {
  id: string;
  title?: string;
}

export interface sqlHelperInfo {
  columns: dbColunm[];
  tablesName: string;
  removeDefaultColumn?: boolean;
  additionQuery?: string;
  additionTable?: string;
  filterQuery?: string;
  orderQuery? : string;
  groupBy?: string;
}

export function genSelectQuery(cols: dbColunm[]) {
  return cols
    .map((item) => {
      let q = "";
      q += item.id;
      q += ` as ${item.title || toCamelCase(item.id)}`;
      return q;
    })
    .join(",");
}

export function toCamelCase(s: string) {
  s = s.split("_").join("");
  return s.charAt(0).toLocaleLowerCase() + s.slice(1);
}

export const defaultColumns = (tablesName: string) =>
  `,${tablesName}.Is_Active as isActive, ${tablesName}.Created as created, ${tablesName}.Created_By as createdBy, ${tablesName}.Modified as modified, ${tablesName}.Modified_By as modifiedBy `;

export const DEFAULT_COL = ['Is_Active', 'Created', 'Created_By', 'Modified', 'Modified_By']

export function revertCamelCase(s: string) {
  s = s.split("_").join("");
  return s.charAt(0).toLocaleLowerCase() + s.slice(1);
}

export function removeAccents(str) {
  str = str.replace(/[^a-zA-Z ]/g, "")
  return str.normalize('NFD').replace(/[\u0300-\u036f]/g, '').replace(/\s\s+/g, ' ').replace(/\s/g, '-');
}

export async function getUser(req, isGetAll?): Promise<any> {
  try {
    const decoded = await verifyToken(
      req.headers.authtoken,
      refreshTokenSecret
    );
    if(!decoded){
      return;
    }
    if(!isGetAll) {
      return decoded.data.account;
    }
    return sqlHelper.getUser(decoded.data.account)
  } catch (error) {
    return '';
  }
 

  
 
}
