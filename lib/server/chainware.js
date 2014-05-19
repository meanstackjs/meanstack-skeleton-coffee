module.exports.config = function($config, $env) {
  $config.database.uri = process.env.MONGODB_DATABASE || 'mongodb://localhost/meanstackjs';
  $config.secret = 'SECRET YOU SHOULD CHANGE';
  $config.middleware['morgan'] = false;
  return $config.port = 3000;
};
