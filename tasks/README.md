This folder contains all the gulp bootstrap code.

Because of how ugly gulp files can get when everything is tossed
into a single file; the tasks are broken into small filters. Each
filter does one job and one job only.

The filters are all auto loaded through the index.coffee which applys gulp
and config options from the config.coffee.

This is a basic template for creating a new filter.
```coffeescript
module.exports = (gulp, config) ->
  gulp.task 'taskname', [], () ->
  	gulp.src 'src' ...
```

Values such as deps and src files should be provided from the config.