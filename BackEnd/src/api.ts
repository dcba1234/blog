import { routeCon } from "./controllers/routeController";
import { settingWeb } from "./controllers/settingwebController";
import { settingPage } from "./controllers/settingwebPageController";

const express = require("express");
const router = express.Router();
export const initAPIs = (app) => {
  router.get("/setting-web", settingWeb.getAll())
  router.get("/setting-web/list", settingWeb.getPage())
  router.get("/setting-web/:id", settingPage.getPage())
  router.post("/setting-web/save", settingPage.save())
  router.delete("/setting-web/delete/:id", settingPage.delete())

  return app.use("/", router);
}