module.exports = ($router, $route, ExampleCtrl) ->
  $route.get '/', (req, res) ->
    ExampleCtrl.hello req, res

  $router.use '/', $route
