app = mean.module mean.name, []

# Bootstrap
mean.ready = (app) ->
  if window.location.hash is '#_=_'
    window.location.hash = '#!'
mean.bootstrap = (app) ->
  angular.bootstrap document, [app.name]
mean.init app

# Config
app.config(() ->)

# Run
app.run(['$rootScope', '$mean', ($rootScope, $mean) ->
  $rootScope.$mean = $mean # register mean into global scope
])
