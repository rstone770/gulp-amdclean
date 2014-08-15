module.exports = (gulp, config) ->
  options = config?.default or {}

  gulp.task 'default', options.deps
