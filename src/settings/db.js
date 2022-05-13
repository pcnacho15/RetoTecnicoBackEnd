const mysql = require('mysql');
const { database } = require('./keys');
const { promisify } = require('util');

const pool = mysql.createConnection(database);

pool.connect((err)=>{
    if(err){
       console.log("Error db ", err.code);
    }
    else{
        console.log("La base de datos ha sido conectada");
    }

});

module.exports = pool;