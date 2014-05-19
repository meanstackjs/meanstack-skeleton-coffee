module.exports = function($router, $route, ExampleCtrl) {
  $route.get('/', function(req, res) {
    return ExampleCtrl.hello(req, res);
  });
  return $router.use('/', $route);
};
