app = meanstack.module meanstack.name, []

# Bootstrap
meanstack.ready = (app) ->
  if window.location.hash is '#_=_'
    window.location.hash = '#!'
meanstack.bootstrap = (app) ->
  angular.bootstrap document, [app.name]
meanstack.init app

# Config
app.config(['$urlRouterProvider',
  ($urlRouterProvider) ->
    $urlRouterProvider.otherwise('/')
])

# Run
app.run(['$mean', ($mean) ->
  $rootScope.$mean = $mean # register mean into global scope
])
