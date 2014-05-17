controller = ($scope) ->
  $scope.hello = 'Hello MEAN Stack App!'
  return

app = mean.project mean.appname
app.controller app.mean.module('IndexController'), [
  '$scope', controller
]
