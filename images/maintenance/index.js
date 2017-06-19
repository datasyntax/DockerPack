var port = process.env.PORT;
// var msg = process.env.MESSAGE || 'We are down for maintenance and will be back shortly. Sorry for any inconvenience.';
//
// var http = require('http');
var connect = require('connect');
var serveStatic = require('serve-static');

connect().use(serveStatic(__dirname)).listen(port, function(){
   console.log('Server running on port ', port);
});

// http.createServer(function (req, res) {
//     res.writeHead(200, {'Content-Type': 'text/plain'});
//     res.end(msg);
// }).listen(port, '0.0.0.0');
// console.log('Maintenance server running at http://0.0.0.0:'+port+'/');
