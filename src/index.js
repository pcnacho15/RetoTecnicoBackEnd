const express = require('express');
const app = express();
const pool = require('./settings/db');
const bodyParser = require('body-parser');
const cors = require('cors');

app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

app.use(cors());

//Rutas

const authRoutes = require('./routes/authentication');
const rondas = require('./routes/Rondas/rondas');

app.use('/user', authRoutes);
app.use('/rondas', rondas);


module.exports = app;