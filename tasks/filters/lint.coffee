coffeelint = require 'gulp-coffeelint'
glob = require 'glob'

module.exports = (gulp, config) ->
  options = config?.lint or {}

  gulp.task 'lint', options.deps, ->
    gulp.src options.paths
      .pipe do coffeelint
      .pipe do coffeelint.reporter
      .pipe coffeelint.reporter 'fail'