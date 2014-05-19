module.exports = ($views) ->
  hello: (req, res) ->
    $views.index.render(req, res)
