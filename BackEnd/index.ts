import express from "express";
import { testing } from "./src/test";
// rest of the code remains same
const app = express();
const PORT = 8000;
app.get("/", (req, res) => {
  res.send("Express + TypeScript Server"+testing);
});
app.listen(PORT, () => {
  console.log(`⚡️[server]: Server is running at https://localhost:${PORT}`);
});
