var path = require('path');
var src = path.normalize(__dirname + '/lib/server');
module.exports = require('meanstack-framework').project(__dirname, src, '.js');
