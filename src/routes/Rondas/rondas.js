const express = require('express');
const app = express.Router();
const conn = require('../../settings/db'); //Se obtiene la conexión de la bd

//Se hace una consulta sql hacia la bd para traernos las rondas que el usuario pide
app.get('/:dificultad', (req, res) => {
    const {dificultad} = req.params;
    conn.query(`select 
    RetoTecnico.ronda.num_ronda, 
    RetoTecnico.ronda.premio, 
    RetoTecnico.pregunta.id_pregunta, 
    RetoTecnico.pregunta.pregunta, 
    RetoTecnico.pregunta.dificultad ,
    RetoTecnico.categoria.nombre_categoria,
    RetoTecnico.respuesta.id_respuesta, 
    RetoTecnico.respuesta.respuesta  
    from RetoTecnico.ronda
    join RetoTecnico.pregunta on RetoTecnico.ronda.id_pregunta = RetoTecnico.pregunta.id_pregunta
    join RetoTecnico.categoria on RetoTecnico.categoria.id_categoria = RetoTecnico.pregunta.id_categoria 
    join RetoTecnico.respuesta on RetoTecnico.respuesta.id_respuesta = RetoTecnico.pregunta.id_respuesta
    where RetoTecnico.pregunta.dificultad = ${dificultad}`,
    (err, row, fields) => {
        if (!err) {
            res.json(row);
        } else {
            res.json(err);
        }
    });
});

//Se traen las opciones de acuerdo a la pregunta escogida por el sistema
app.get('/opciones/:id_pregunta', (req, res) => {
    const {id_pregunta} = req.params
    conn.query(`select 
    opcion 
    from RetoTecnico.opcion
    where id_pregunta = ${id_pregunta}`,
    (err, row, fields) => {
        if (!err) {
            res.json(row);
        } else {
            res.json(err);
        }
    });
});

//Se crea el intento de juego que hizo el usuario
app.post('/participacion', (req, res) => {
    const {
        fecha_participa,
        id_jugador,
        premioObtenido
    } = req.body
    conn.query('insert into RetoTecnico.participacion (fecha_participa,premioObtenido,id_jugador) values(?,?,?)',
        [fecha_participa, premioObtenido, id_jugador],
        (err, rows, fields) => {
            if (!err) {
                res.json("Participación registrada")
            } else {
                res.json(err);
            }
        });
});

//Se trae la información de todos los intentos que realizó el jugador que tenga la sesión iniciada
app.get('/jugadorParticipado/:id_jugador', (req,res)=>{
    const {id_jugador} = req.params
    conn.query(`
    select  
    RetoTecnico.jugador.nombre, 
    RetoTecnico.participacion.fecha_participa, 
    RetoTecnico.participacion.premioObtenido
    from RetoTecnico.participacion 
    join RetoTecnico.jugador on RetoTecnico.jugador.id_jugador = RetoTecnico.participacion.id_jugador  
    where RetoTecnico.participacion.id_jugador = ${id_jugador}
    `,
    (err,row,fields)=>{
        if (!err) {
            res.json(row);
        } else {
            res.json(err);
        }
    });

});




module.exports = app;