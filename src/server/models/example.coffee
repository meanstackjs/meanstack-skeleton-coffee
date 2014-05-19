module.exports.schema = ($mongoose) ->
  new $mongoose.Schema(
    title:
      type: String,
      required: true
  )

module.exports.model = ($connection, ExampleSchema) ->
  $connection.model('Example', ExampleSchema)
