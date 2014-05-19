module.exports.config = ($config, $env) ->
  $config.database.uri = \
    process.env.MONGODB_DATABASE or 'mongodb://localhost/meanstackjs'
  $config.secret = 'SECRET YOU SHOULD CHANGE'
  $config.middleware['morgan'] = false
  $config.port = 3000
