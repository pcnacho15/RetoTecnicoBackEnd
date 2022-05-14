const mysql = require('mysql'); //Se obtienen los plugings de mysql
const { database } = require('./keys'); //Se obtienen los datos de ingreso

const pool = mysql.createConnection(database); //Creamos la conexión hacia la bd

pool.connect((err)=>{
    if(err){
       console.log("Error db ", err.code);
    }
    else{
        console.log("La base de datos ha sido conectada");
    }

});

module.exports = pool;