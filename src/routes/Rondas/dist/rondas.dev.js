"use strict";

var express = require('express');

var app = express.Router();

var conn = require('../../settings/db'); //Se obtiene la conexión de la bd
//Se hace una consulta sql hacia la bd para traernos las rondas que el usuario pide


app.get('/:dificultad', function (req, res) {
  var dificultad = req.params.dificultad;
  conn.query("select \n    RetoTecnico.ronda.num_ronda, \n    RetoTecnico.ronda.premio, \n    RetoTecnico.pregunta.id_pregunta, \n    RetoTecnico.pregunta.pregunta, \n    RetoTecnico.pregunta.dificultad ,\n    RetoTecnico.categoria.nombre_categoria,\n    RetoTecnico.respuesta.id_respuesta, \n    RetoTecnico.respuesta.respuesta  \n    from RetoTecnico.ronda\n    join RetoTecnico.pregunta on RetoTecnico.ronda.id_pregunta = RetoTecnico.pregunta.id_pregunta\n    join RetoTecnico.categoria on RetoTecnico.categoria.id_categoria = RetoTecnico.pregunta.id_categoria \n    join RetoTecnico.respuesta on RetoTecnico.respuesta.id_respuesta = RetoTecnico.pregunta.id_respuesta\n    where RetoTecnico.pregunta.dificultad = ".concat(dificultad), function (err, row, fields) {
    if (!err) {
      res.json(row);
    } else {
      res.json(err);
    }
  });
}); //Se traen las opciones de acuerdo a la pregunta escogida por el sistema

app.get('/opciones/:id_pregunta', function (req, res) {
  var id_pregunta = req.params.id_pregunta;
  conn.query("select \n    opcion \n    from RetoTecnico.opcion\n    where id_pregunta = ".concat(id_pregunta), function (err, row, fields) {
    if (!err) {
      res.json(row);
    } else {
      res.json(err);
    }
  });
}); //Se crea el intento de juego que hizo el usuario

app.post('/participacion', function (req, res) {
  var _req$body = req.body,
      fecha_participa = _req$body.fecha_participa,
      id_jugador = _req$body.id_jugador,
      premioObtenido = _req$body.premioObtenido;
  conn.query('insert into RetoTecnico.participacion (fecha_participa,premioObtenido,id_jugador) values(?,?,?)', [fecha_participa, premioObtenido, id_jugador], function (err, rows, fields) {
    if (!err) {
      res.json("Participación registrada");
    } else {
      res.json(err);
    }
  });
}); //Se trae la información de todos los intentos que realizó el jugador que tenga la sesión iniciada

app.get('/jugadorParticipado/:id_jugador', function (req, res) {
  var id_jugador = req.params.id_jugador;
  conn.query("\n    select  \n    RetoTecnico.jugador.nombre, \n    RetoTecnico.participacion.fecha_participa, \n    RetoTecnico.participacion.premioObtenido\n    from RetoTecnico.participacion \n    join RetoTecnico.jugador on RetoTecnico.jugador.id_jugador = RetoTecnico.participacion.id_jugador  \n    where RetoTecnico.participacion.id_jugador = ".concat(id_jugador, "\n    "), function (err, row, fields) {
    if (!err) {
      res.json(row);
    } else {
      res.json(err);
    }
  });
});
module.exports = app;