path = require 'path'
src = path.normalize("#{__dirname}/src/server")
module.exports = require('meanstack-framework').project(__dirname, src, '.coffee')
