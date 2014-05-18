controller = ($scope) ->
  $scope.hello = 'Hello MEAN Stack App!'
  return

app = mean.module mean.appname, 'project'
app.controller app.mean.module('IndexController'), [
  '$scope', controller
]
