app = mean.module mean.appname, 'project', [
  'ui.router'
]

# Bootstrap
mean.ready = (app) ->
  if window.location.hash is '#_=_'
    window.location.hash = '#!'
mean.bootstrap = (app) ->
  angular.bootstrap document, [app.name]
mean.init app

# Config
app.config(['$stateProvider', '$urlRouterProvider', '$locationProvider',
  ($stateProvider, $urlRouterProvider, $locationProvider) ->
    $stateProvider.state('index',
      url: '/'
      templateUrl: app.mean.resource('views/index.html')
      controller: app.mean.module('IndexController')
    )
    $urlRouterProvider.otherwise('/')
])

# Run
app.run(['$rootScope', '$state', '$stateParams'
  ($rootScope, $state, $stateParams) ->
    $rootScope.$state = $state
    $rootScope.$stateParams = $stateParams
    $rootScope.mean = mean # register mean into global scope
])
