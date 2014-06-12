module.exports = function (grunt) {
  buildpack = require('meanstack-buildpack-coffee')(__dirname, grunt);
  buildpack.build();
};
