var mysql = require('mysql');
var pool = mysql.createPool({
  connectionLimit : 10,
  host            : 'classmysql.engr.oregonstate.edu',
  user            : 'cs340_westerhs',
  password        : 'iris',
  database        : 'cs340_westerhs'
});
module.exports.pool = pool;
