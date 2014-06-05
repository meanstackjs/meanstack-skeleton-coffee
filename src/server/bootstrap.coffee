exports.vhosts = ($app, $dir, $ext) ->
  vhosts = [
    callback: (req, res, next) ->
      $app req, res, next
    hostnames: []
    paths: []
    protocols: []
    ports: []
    methods: []
  ]
  return vhosts

exports.server = ($server, $config) ->
  http = require 'http'
  port = process.env.PORT or $config.port
  server = http.createServer($server).listen port, ->
    console.log 'Server listening on port ' + port
  return server
