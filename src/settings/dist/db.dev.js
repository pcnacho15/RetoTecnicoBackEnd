"use strict";

var mysql = require('mysql'); //Se obtienen los plugings de mysql


var _require = require('./keys'),
    database = _require.database; //Se obtienen los datos de ingreso


var pool = mysql.createConnection(database); //Creamos la conexión hacia la bd

pool.connect(function (err) {
  if (err) {
    console.log("Error db ", err.code);
  } else {
    console.log("La base de datos ha sido conectada");
  }
});
module.exports = pool;