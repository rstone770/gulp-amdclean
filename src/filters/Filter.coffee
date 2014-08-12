through = require 'map-stream'

StreamingError      = require '../errors/Streaming'
NotImplementedError = require '../errors/NotImplemented'

module.exports =

  class Filter

    # Filters data via async callbacks
    # 
    # @throws {errors/StreamingError} if a data stream is passed instead of chunks
    # 
    # @param {!Object}   next
    # @param {!Function} 
    filter: (data, next) ->
      if data.isNull()
        return next null, data
      else if data.isStream()
        return next new StreamingError
      
      filtered = @process data

      data.contents = new Buffer filtered

      next null, data

    # Process the data object.
    # 
    # @throws {errors/NotImplementedError}
    # 
    # @param {!Object}
    process: (data) ->
      throw new NotImplementedError

    # Returns stream wrapped filter
    # 
    # @Returns {!Stream}
    stream: () ->
      return @_stream if @_stream?

      @_stream = through (args...) =>
        @filter.apply @, args