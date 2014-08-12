mocha = require 'gulp-mocha'

module.exports = (gulp, config) ->
  options = config?.spec or {}

  filter = mocha options.options

  gulp.task 'spec', options.deps, ->
    gulp
      .src options.paths
      .pipe filter
