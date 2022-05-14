const express = require('express'); //Se obtienen las herramientas del framework de express
const app = express();
const bodyParser = require('body-parser'); 
const cors = require('cors');

app.use(bodyParser.urlencoded({extended:false}));
app.use(bodyParser.json());

app.use(cors());

//Se obtienen las rutas de la api para manipular la información de la base de datos
const authRoutes = require('./routes/jugadores');
const rondas = require('./routes/Rondas/rondas');

app.use('/user', authRoutes);
app.use('/rondas', rondas);


module.exports = app;