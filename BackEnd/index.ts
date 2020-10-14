import express from "express";
import { initAPIs } from "./src/api";
// rest of the code remains same
var cors = require('cors')
const bodyParser = require("body-parser");
const app = express();
app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(cors())
initAPIs(app);
const PORT = 8000;
// app.get("/", (req, res) => {
//   var request = require("request");
  
//   request(
//     { uri: "https://stackoverflow.com/questions/24454371/how-can-i-get-the-typescript-compiler-to-output-the-compiled-js-to-a-different-d" },
//     function(error, response, body) {
//       console.log(typeof body)
//       res.send(body)
//     }
//   );
// });

app.listen(PORT, () => {
  console.log(`⚡️[server]: Server is running at https://localhost:${PORT}`);
});
