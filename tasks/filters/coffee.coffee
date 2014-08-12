coffee  = require 'gulp-coffee'
gutil   = require 'gutil'

module.exports = (gulp, config) ->
  options = config?.coffee or {}

  filter = coffee options.options

  filter.on 'error', gutil.log

  gulp.task 'coffee', options.deps, ->
    gulp
      .src options.paths
      .pipe filter
      .pipe gulp.dest options.out
