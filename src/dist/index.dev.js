"use strict";

var express = require('express'); //Se obtienen las herramientas del framework de express


var app = express();

var bodyParser = require('body-parser');

var cors = require('cors');

app.use(bodyParser.urlencoded({
  extended: false
}));
app.use(bodyParser.json());
app.use(cors()); //Se obtienen las rutas de la api para manipular la información de la base de datos

var authRoutes = require('./routes/jugadores');

var rondas = require('./routes/Rondas/rondas');

app.use('/user', authRoutes);
app.use('/rondas', rondas);
module.exports = app;