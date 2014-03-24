var jshint = require('gulp-jshint'),
    map    = require('map-stream');

var onError = map(function(file, callback) {
  if(!file.jshint.success) {
    return process.exit(1);
  }

  callback();
});

module.exports = function(gulp, config) {
  var options = config.lint;

  gulp.task('lint', options.deps, function() {
    var paths = Object.keys(config.paths).map(function(key) {
      return config.paths[key];
    });

    var stream = gulp
      .src(paths)
      .pipe(jshint())
      .pipe(jshint.reporter(options.reporter))
      .pipe(onError);

    return stream;
  });
};