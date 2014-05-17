module.exports.config = (config, environment) ->
  config.database.uri = \
    process.env.MONGODB_DATABASE or 'mongodb://localhost/openmean'
  config.secret = 'SECRET YOU SHOULD CHANGE'
  config.middleware['morgan'] = false
  config.port = 3000
