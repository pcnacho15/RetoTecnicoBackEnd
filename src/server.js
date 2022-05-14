//Este apartado es exclusivamente para crear el servidor por el puerto 3000
const http = require('http');
const app = require('./index');
const port = process.env.PORT || 3000;

const server = http.createServer(app);

server.listen(port);