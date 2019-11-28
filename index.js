
var express = require('express');
var app = express();
const mysql = require('mysql');

const connection = mysql.createConnection({
  host: 'hostmachine',
  port: 3306,
  user: 'root',
  password: 'password',
  database: 'teste'
});

app.get('/', function (req, res) {
  
  console.log("processing request");
  const sql = "select * from teste";

  connection.query(sql, function (error, results, fields) {
    if (error)
      res.json(error);
    else
      res.json(results);
    console.log('executou!');
  });
});

app.listen(3000, function () {
  console.log('Example app listening on port 3000!');
});