"use strict";

var express = require('express');

var app = express.Router();

var conn = require('../settings/db');

var jwt = require('jsonwebtoken');

app.get('/', function (req, res) {
  conn.query('select * from RetoTecnico.jugador', function (err, row, fields) {
    if (!err) {
      res.json(row);
    } else {
      console.log(err);
    }
  });
});
app.post('/registro', function (req, res) {
  var _req$body = req.body,
      nombre = _req$body.nombre,
      apellido = _req$body.apellido,
      premio = _req$body.premio;
  conn.query('insert into RetoTecnico.jugador (nombre,apellido,premio) values(?,?,?)', [nombre, apellido, premio], function (err, rows, fields) {
    if (!err) {
      conn.query("select \n                id_jugador,\n                nombre,\n                apellido \n                from RetoTecnico.jugador\n                WHERE nombre = ? and apellido = ?", [nombre, apellido], function (err, rows, fields) {
        if (!err) {
          if (rows.length > 0) {
            var data = rows[0];
            var token = jwt.sign(JSON.stringify(data), 'RetoTecnico');
            res.json({
              token: token
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
app.post('/loguear', function (req, res) {
  var _req$body2 = req.body,
      nombre = _req$body2.nombre,
      apellido = _req$body2.apellido;
  console.log(req.body);
  conn.query("select \n                id_jugador,\n                nombre,\n                apellido \n                from RetoTecnico.jugador\n                WHERE nombre = ? and apellido = ?", [nombre, apellido], function (err, rows, fields) {
    if (!err) {
      if (rows.length > 0) {
        var data = rows[0];
        var token = jwt.sign(JSON.stringify(data), 'RetoTecnico');
        res.json({
          token: token
        });
      } else {
        res.json(false);
      }
    } else {
      res.json(err);
    }
  });
});
app.put('/premio', function (req, res) {
  var _req$body3 = req.body,
      id_jugador = _req$body3.id_jugador,
      nombre = _req$body3.nombre,
      apellido = _req$body3.apellido,
      premio = _req$body3.premio;
  conn.query("\nupdate RetoTecnico.jugador\nset premio = ?\nwhere id_jugador = ".concat(id_jugador, "\n"), [premio], function (err, rows, fields) {
    if (!err) {
      res.json("Se guardó el premio");
    } else {
      res.json(err);
    }
  });
});
module.exports = app;