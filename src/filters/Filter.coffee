through = require 'map-stream'

StreamingError       = require '../errors/Streaming'
NotImplementedError  = require '../errors/NotImplemented'
vinylSourcemapsApply = require 'vinyl-sourcemaps-apply'

module.exports =

  # an abstract filter class that simply allows block transforms
  # to be converted into streams with basic validation
  class Filter

    filter: (data, next) ->
      if data.isNull()
        return next null, data
      else if data.isStream()
        return next new StreamingError
      
      filtered = @process data

      if (!!filtered.code)
        data.contents = new Buffer filtered.code
        if data.sourceMap
          map = JSON.parse filtered.map.toString()
          # console.log('---');
          # console.log(data.path);
          # console.log(data.relative);
          # console.log(map.sources);
          # console.log('---');
          map.file = data.relative
          vinylSourcemapsApply data, map

      else
        data.contents = new Buffer filtered

      next null, data

    process: (data) ->
      throw new NotImplementedError

    stream: () ->
      return @_stream if @_stream?

      @_stream = through (args...) =>
        @filter.apply @, args