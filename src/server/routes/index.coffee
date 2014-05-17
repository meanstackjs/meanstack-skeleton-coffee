module.exports = (router, route, controllers) ->
  route.get '/', (req, res) ->
    controllers.index.hello req, res

  router.use '/', route
