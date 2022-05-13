"use strict";

var express = require('express');

var app = express();

var pool = require('./settings/db');

var bodyParser = require('body-parser');

var cors = require('cors');

app.use(bodyParser.urlencoded({
  extended: false
}));
app.use(bodyParser.json());
app.use(cors()); //Rutas

var authRoutes = require('./routes/authentication');

var rondas = require('./routes/Rondas/rondas');

app.use('/user', authRoutes);
app.use('/rondas', rondas);
module.exports = app;