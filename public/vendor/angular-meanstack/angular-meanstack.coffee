((window, document) ->
  modules = {}
  mean = {}
  mean.modules = []

  if window.mean?
    mean.name = window.mean.replace(/[.-_]/g, '.')

  mean.module = (name, type, dependencies) ->
    if name of modules
      return modules[name]
    if not type?
      dependencies = []
      type = 'project'
    else if typeof type is 'object'
      dependencies = type
      type = 'project'
    mean.modules.push name
    modules[name] = angular.module name, dependencies
    modules[name].mean = {}
    modules[name].mean.name = name
    if type is 'project'
      modules[name].mean.namespace = (str) ->
        return "#{modules[name].name}.#{str}"
      modules[name].mean.asset = (str) ->
        return "public/#{str}"
      modules[name].mean.resource = (str) ->
        return "public/js/#{str}"
    else if type is 'plugin'
      modules[name].mean.namespace = (str) ->
        return "#{modules[name].name}.#{str}"
      modules[name].mean.asset = (str) ->
        return "public/plugins/#{modules[name].mean.name}/#{str}"
      modules[name].mean.resource = (str) ->
        return "public/plugins/#{modules[name].mean.name}/js/#{str}"
    mean[name] = modules[name].mean
    return modules[name]

  mean.init = (app) ->
    angular.element(document).ready ->
      if mean.ready?
        mean.ready(app)
      injector = angular.injector(['ng'])
      $http = injector.get('$http')
      $http.get('/mean.json').then (response) ->
        if not mean.name?
          mean.name = response.data.name
        mean.mount = response.data.mount
        mean.assets = response.data.assets
        for name in mean.modules
          nodename = name.replace(/[.-_]/g, '-')
          if mean.assets[nodename]?
            mean[name].assets = mean.assets[nodename]
        app.constant '$mean', mean
        if not mean.boostrap?
          angular.bootstrap document, [app.name]
        else
          mean.boostrap(app)
    return

  window.mean = mean
)(window, document)
