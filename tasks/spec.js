var mocha = require('gulp-mocha');

module.exports = function(gulp, config) {
  var options = config.spec,
      paths   = [];

  paths = [
    config.paths.spec
  ].concat(options.paths);

  gulp.task('spec', options.deps, function() {
    var stream = gulp
      .src(paths)
      .pipe(mocha(options.config));

    return stream;
  });
};