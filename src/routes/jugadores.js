const express = require('express');
const app = express.Router();
const conn = require('../settings/db');
const jwt = require('jsonwebtoken');

//Función para traer jugadores que hayan participado
app.get('/', (req, res) => {
    conn.query('select * from RetoTecnico.jugador', (err, row, fields) => {
        if (!err) {
            res.json(row);
        } else {
            console.log(err);
        }
    });
});

//Función para  registrar a un nuevo jugador
app.post('/registro', (req, res) => {
    const {
        nombre,
        apellido,
        premio
    } = req.body
    conn.query('insert into RetoTecnico.jugador (nombre,apellido,premio) values(?,?,?)',
        [nombre, apellido, premio],
        (err, rows, fields) => {
            if (!err) {
                conn.query(`select 
                id_jugador,
                nombre,
                apellido 
                from RetoTecnico.jugador
                WHERE nombre = ? and apellido = ?`,
                    [nombre, apellido],
                    (err, rows, fields) => {
                        if (!err) {
                            if (rows.length > 0) {
                                let data = rows[0];
                                const token = jwt.sign(JSON.stringify(data), 'RetoTecnico');
                                res.json({
                                    token
                                });
                            } else {
                                res.json(false);
                            }
                        } else {
                            res.json(err);
                        }
                });
            }
    });
});


//Función para loguear a un jugador
app.post('/loguear', (req, res) => {
    const {
        nombre,
        apellido
    } = req.body;
    conn.query(`select 
                id_jugador,
                nombre,
                apellido 
                from RetoTecnico.jugador
                WHERE nombre = ? and apellido = ?`,
        [nombre, apellido],
        (err, rows, fields) => {
            if (!err) {
                if (rows.length > 0) {
                    let data = rows[0];
                    const token = jwt.sign(JSON.stringify(data), 'RetoTecnico');
                    res.json({
                        token
                    });
                } else {
                    res.json(false);
                }
            } else {
                res.json(err);
            }
        });
});

//Función para actualizar el premio actual de cada jugador
app.put('/premio', (req,res)=>{
const {id_jugador, nombre, apellido, premio} = req.body;
conn.query(`
update RetoTecnico.jugador
set premio = ?
where id_jugador = ${id_jugador}
`,[premio],
(err,rows,fields)=>{
    if (!err) {
        res.json("Se guardó el premio");
    }else{
        res.json(err);
    }
}

);


});




module.exports = app;