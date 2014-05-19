(function(window, document) {
  var mean, modules;
  modules = {};
  mean = {};
  mean.modules = [];
  if (window.mean != null) {
    mean.name = window.mean.replace(/[.-_]/g, '.');
  }
  mean.module = function(name, type, dependencies) {
    if (name in modules) {
      return modules[name];
    }
    if (type == null) {
      dependencies = [];
      type = 'project';
    } else if (typeof type === 'object') {
      dependencies = type;
      type = 'project';
    }
    mean.modules.push(name);
    modules[name] = angular.module(name, dependencies);
    modules[name].mean = {};
    modules[name].mean.name = name;
    if (type === 'project') {
      modules[name].mean.namespace = function(str) {
        return "" + modules[name].name + "." + str;
      };
      modules[name].mean.asset = function(str) {
        return "public/" + str;
      };
      modules[name].mean.resource = function(str) {
        return "public/js/" + str;
      };
    } else if (type === 'plugin') {
      modules[name].mean.namespace = function(str) {
        return "" + modules[name].name + "." + str;
      };
      modules[name].mean.asset = function(str) {
        return "public/plugins/" + modules[name].mean.name + "/" + str;
      };
      modules[name].mean.resource = function(str) {
        return "public/plugins/" + modules[name].mean.name + "/js/" + str;
      };
    }
    mean[name] = modules[name].mean;
    return modules[name];
  };
  mean.init = function(app) {
    angular.element(document).ready(function() {
      var $http, injector;
      if (mean.ready != null) {
        mean.ready(app);
      }
      injector = angular.injector(['ng']);
      $http = injector.get('$http');
      return $http.get('/mean.json').then(function(response) {
        var name, nodename, _i, _len, _ref;
        if (mean.name == null) {
          mean.name = response.data.name;
        }
        mean.mount = response.data.mount;
        mean.assets = response.data.assets;
        _ref = mean.modules;
        for (_i = 0, _len = _ref.length; _i < _len; _i++) {
          name = _ref[_i];
          nodename = name.replace(/[.-_]/g, '-');
          if (mean.assets[nodename] != null) {
            mean[name].assets = mean.assets[nodename];
          }
        }
        app.constant('$mean', mean);
        if (mean.boostrap == null) {
          return angular.bootstrap(document, [app.name]);
        } else {
          return mean.boostrap(app);
        }
      });
    });
  };
  return window.mean = mean;
})(window, document);

//# sourceMappingURL=angular-meanstack.js.map
