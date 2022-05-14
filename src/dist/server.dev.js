"use strict";

//Este apartado es exclusivamente para crear el servidor por el puerto 3000
var http = require('http');

var app = require('./index');

var port = process.env.PORT || 3000;
var server = http.createServer(app);
server.listen(port);