import { getUser } from './../common';
import { ISettingWeb } from '../models/SettingWeb';
import { dbColunm, DEFAULT_COL, getDataFromQuery, sqlHelper, toCamelCase } from '../common';
import moment from 'moment';
import { db } from '../db';
import { debug } from 'console';
import { verifyToken, generateToken } from '../helper/jwt.helper';
let tokenList = {};
// Thời gian sống của token
const accessTokenLife = process.env.ACCESS_TOKEN_LIFE || "100d";
// Mã secretKey này phải được bảo mật tuyệt đối, các bạn có thể lưu vào biến môi trường hoặc file
const accessTokenSecret =
  process.env.ACCESS_TOKEN_SECRET || "access-token-secret-tienthanh";

// Thời gian sống của refreshToken
const refreshTokenLife = process.env.REFRESH_TOKEN_LIFE || "3650d";
// Mã secretKey này phải được bảo mật tuyệt đối, các bạn có thể lưu vào biến môi trường hoặc file
const refreshTokenSecret =
  process.env.REFRESH_TOKEN_SECRET || "access-token-secret-tienthanh";
class UserController {
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
  colSave = ['First_Name','Last_Name','Password', 'Account' ,'Is_Active' , ...DEFAULT_COL]
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
      let key = ` Role <> 'Admin' `;
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
      dataSave.Created_By = getUser(req);
      dataSave.Modified_By = getUser(req);
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
      console.log(q);
      
      await getDataFromQuery(q, req.params.id)
      res.json();
    }
  }

  deactive() {
    return async (req, res) => {
      const q = `UPDATE ${this.tablesName} SET Is_Active = false WHERE Account = ?`;
      console.log(q);
      await getDataFromQuery(q, req.params.id)
      res.json();
    }
  }

  active() {
    return async (req, res) => {
      const q = `UPDATE ${this.tablesName} SET Is_Active = true WHERE Account = ?`;
      console.log(q);
      await getDataFromQuery(q, req.params.id)
      res.json();
    }
  }


  authentication(Account) {
      const q = `Select * from ${this.tablesName} WHERE Account = ?`;
      return getDataFromQuery(q, Account);
  }

  register() {
    return async (req, res) => {
      console.log(req.user)
      const acc = await this.authentication(req.body.user.account);
      console.log(acc, 'heloooooooooooooooooooooo');
      
      if(acc.length > 0) {
        res.status(403).send("That account has been taken. Try another.");
        return;
      } 
      let dataSave: any = {}
      this.colSave.map((key) => {
        dataSave[key] = req.body.user[toCamelCase(key)];
      })
      dataSave.Modified = moment().format('YYYY-MM-DD hh:mm:ss');
      dataSave.Created = moment().format('YYYY-MM-DD hh:mm:ss');
      dataSave.Created_By = getUser(req);
      dataSave.Modified_By = getUser(req);
      dataSave.Is_Active = true;
      dataSave.role = 'user'
      console.log(dataSave, 'dataaaaaaaaa');
      
      const rs = await sqlHelper.save(this.tablesName, dataSave);
      this.login()(req,res);
    }
  }

  login(){
    return async (req, res) => {
      try {
        let result = (await sqlHelper.getUserValidate(req.body.user.account, req.body.user.password))[0];
        console.log(result);
        
        if (!result) {
          res.status(401).send("Wrong account or password");
          return;
        }
        const userData = {
          firstName: result.firstName,
          lastName: result.lastName,
          email: result.email,
          account: result.account,
          role: result.role
        };
        const accessToken = await generateToken(
          userData,
          accessTokenSecret,
          accessTokenLife
        );
    
        // debug(`Thực hiện tạo mã Refresh Token, [thời gian sống 10 năm] =))`);
        const refreshToken = await generateToken(
          userData,
          refreshTokenSecret,
          refreshTokenLife
        );
    
        // Lưu lại 2 mã access & Refresh token, với key chính là cái refreshToken để đảm bảo unique và không sợ hacker sửa đổi dữ liệu truyền lên.
        // lưu ý trong dự án thực tế, nên lưu chỗ khác, có thể lưu vào Redis hoặc DB
        tokenList[refreshToken] = { accessToken, refreshToken };
    
        // debug(`Gửi Token và Refresh Token về cho client...`);
        return res.status(200).json({ accessToken, refreshToken });
      } catch (error) {
         return res.status(500).json(error);
      }
    };
  }


}
export const user = new UserController();

export interface ResponseData {
  page: number,
  total: number,
  itemPerPage: number,
  rows: any[] 
}





let refreshToken = async (req, res) => {
  // User gửi mã refresh token kèm theo trong body
  const refreshTokenFromClient = req.body.refreshToken;
  // debug("tokenList: ", tokenList);

  // Nếu như tồn tại refreshToken truyền lên và nó cũng nằm trong tokenList của chúng ta
  if (refreshTokenFromClient && tokenList[refreshTokenFromClient]) {
    try {
      // Verify kiểm tra tính hợp lệ của cái refreshToken và lấy dữ liệu giải mã decoded
      const decoded = await verifyToken(
        refreshTokenFromClient,
        refreshTokenSecret
      );

      // Thông tin user lúc này các bạn có thể lấy thông qua biến decoded.data
      // có thể mở comment dòng debug bên dưới để xem là rõ nhé.
      // debug("decoded: ", decoded);
      const userFakeData = decoded.data;

      debug(
        `Thực hiện tạo mã Token trong bước gọi refresh Token, [thời gian sống vẫn là 1 giờ.]`
      );
      const accessToken = await generateToken(
        userFakeData,
        accessTokenSecret,
        accessTokenLife
      );

      // gửi token mới về cho người dùng
      return res.status(200).json({ accessToken });
    } catch (error) {
      // Lưu ý trong dự án thực tế hãy bỏ dòng debug bên dưới, mình để đây để debug lỗi cho các bạn xem thôi
      debug(error);

      res.status(403).json({
        message: "Invalid refresh token.",
      });
    }
  } else {
    // Không tìm thấy token trong request
    return res.status(403).send({
      message: "No token provided.",
    });
  }
};