module.exports = function($app, $ext) {
  return [
    {
      callback: function(req, res, next) {
        return $app(req, res, next);
      },
      hostnames: [],
      paths: [],
      protocols: [],
      ports: [],
      methods: []
    }
  ];
};


/*
Plugins:
-------------------------------------------------------------------------------
 * Place this in array
plugin: './plugins/someplugin/app' + $ext
mount: ['/exampleurl']
paths: ['/exampleurl']
install: './plugins/someplugin'
-------------------------------------------------------------------------------
MEAN Stack Apps:
-------------------------------------------------------------------------------
 * Place this above module.exports
exampleapp = require('../somemeanapp')(
  mount: '/exampleurl'
  secret: 'fdasfdsfdasfsa'
).get('$app')
-------------------------------------------------------------------------------
 * Place this in array
callback: (req, res, next) ->
  exampleapp req, res, next
hostnames: []
paths: ['/exampleurl']
protocols: []
ports: []
methods: []
-------------------------------------------------------------------------------
 */
