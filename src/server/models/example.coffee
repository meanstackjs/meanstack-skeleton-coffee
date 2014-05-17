module.exports = (mongoose, connection) ->
  schema = new mongoose.Schema(
    name:
      type: String,
      required: true
  )

  connection.model('example', schema)
