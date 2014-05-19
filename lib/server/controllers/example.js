module.exports = function($views) {
  return {
    hello: function(req, res) {
      return $views.index.render(req, res);
    }
  };
};
