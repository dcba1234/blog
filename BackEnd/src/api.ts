import { comment } from './controllers/commentController';
import { dashboard } from './controllers/DashboardController';
import { post } from './controllers/postController';
import { reason } from './controllers/reasonRPController';
import { tag } from './controllers/TagController';
import { category } from './controllers/CategoryController';
import { routeCon } from "./controllers/routeController";
import { settingWeb } from "./controllers/settingwebController";
import { settingPage } from "./controllers/settingwebPageController";
import { country } from './controllers/CountryController';
import { gender } from './controllers/GenderController';
import { interaction } from './controllers/interactionController';
import { user } from './controllers/UserController';
import { noti } from './controllers/NotiController';
import { settingJob } from './controllers/settingJobController';
const  multipart  =  require('connect-multiparty');
const  multipartMiddleware  =  multipart({ uploadDir:  './Avatar' });

const express = require("express");
const router = express.Router();
export const initAPIs = (app) => {
  router.get("/setting-web", settingWeb.getAll())
  router.post("/setting-web", settingWeb.save())
  router.get("/setting-web/list", settingWeb.getPage())
  router.get("/setting-web/:id", settingPage.getPage())
  router.post("/setting-web/save", settingPage.save())
  router.delete("/setting-web/delete/:id", settingPage.delete())
  router.get("/setting-page/:id", settingPage.getById())
  router.post("/data", settingPage.getDataByUrl())
  router.get("/category/all", category.getAll())
  router.get("/category", category.getPage())
  router.post("/category/save", category.save())
  router.delete("/category/deactive/:id", category.deactive())
  router.delete("/category/active/:id", category.active())





  router.get("/tag", tag.getAll())
  //router.post("/category", category.getAll())


  router.get("/country/all", country.getAll())
  router.get("/country", country.getPage())
  router.post("/country/save", country.save())
  router.delete("/country/deactive/:id", country.deactive())
  router.delete("/country/active/:id", country.active())


  router.get("/job", settingJob.getPage())




  router.get("/gender/all", gender.getAll())
  router.get("/gender", gender.getPage())
  router.post("/gender/save", gender.save())
  router.delete("/gender/deactive/:id", gender.deactive())
  router.delete("/gender/active/:id", gender.active())

  

  router.get("/reason/all", reason.getAll())
  router.get("/reason", reason.getPage())


  router.get("/post", post.getPage())
  router.get("/post/:slug", post.getBySlug())
  router.post("/post", post.save())
  router.delete("/post/deactive/:id", post.deactive())
  router.delete("/post/active/:id", post.active())

  router.post("/comment", post.postComment())
  router.get("/comment/:slug", comment.getPage())

  router.get("/user", user.getPage())
  router.post("/login", user.login())
  router.get("/info", user.getMyInfo())
  router.post("/info", user.updateInfo())
  router.post("/register", user.register())
  router.delete("/user/deactive/:id", user.deactive())
  router.delete("/user/active/:id", user.active())
  router.post("/user/avatar",multipartMiddleware, user.uploadAvatar())

  router.get("/notification", noti.getPage())
  router.delete("/notification/deactive/:id", noti.deactive())
  router.delete("/notification/active/:id", noti.active())

  router.get("/report", interaction.getReportPage())
  router.post("/report", interaction.save(true))
  router.post("/reason", interaction.getReportReason())
  router.get("/report/sum", interaction.getReportSumPage())

  router.get("/dashboard", dashboard.getAll())
  app.use('/avatar', express.static('Avatar'));
  return app.use("/", router);
}