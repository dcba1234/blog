import moment from "moment";
const mysql = require("mysql");
// export const db = mysql.createConnection({
//   host: process.env.DB_HOST || "localhost",
//   user: process.env.DB_USER || "tienthanh217",
//   password: process.env.DB_PASSWORD || "thanhthanh12",
//   database: process.env.DB_NAME || "blog"
// });

var db_config = {
  host: process.env.DB_HOST || "localhost",
  user: process.env.DB_USER || "tienthanh217",
  password: process.env.DB_PASSWORD || "thanhthanh12",
  database: process.env.DB_NAME || "blog"
};
export let db;

function handleDisconnect() {
  db = mysql.createConnection(db_config); // Recreate the connection, since
                                                  // the old one cannot be reused.

                                                  db.connect(function(err) {              // The server is either down
    if(err) {                                     // or restarting (takes a while sometimes).
      console.log('error when connecting to db:' + moment().format('MMMM Do YYYY, h:mm:ss a'));
      setTimeout(handleDisconnect, 2000); // We introduce a delay before attempting to reconnect,
    }                                     // to avoid a hot loop, and to allow our node script to
  });                                     // process asynchronous requests in the meantime.
                                          // If you're also serving http, display a 503 error.
                                          db.on('error', function(err) {
    console.log('db error at ' + + moment().format('MMMM Do YYYY, h:mm:ss a'));
    if(err.code === 'PROTOCOL_CONNECTION_LOST') { // Connection to the MySQL server is usually
      handleDisconnect();                         // lost due to either server restart, or a
    } else {                                      // connnection idle timeout (the wait_timeout
      throw err;                                  // server variable configures this)
    }
  });
}

handleDisconnect();