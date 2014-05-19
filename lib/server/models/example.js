module.exports.schema = function($mongoose) {
  return new $mongoose.Schema({
    title: {
      type: String,
      required: true
    }
  });
};

module.exports.model = function($connection, ExampleSchema) {
  return $connection.model('Example', ExampleSchema);
};
