var glob = require('glob'),
    gulp = require('gulp');

var config = require('./tasks/config.js');

var loadTasks = function(path, gulp, config) {
  var files = glob.sync(path);

  files.forEach(function(file) {
    var module = require(file);

    if(typeof module === 'function') {
      module(gulp, config || {});
    }
  });
};

loadTasks('./tasks/**/*.js', gulp, config);