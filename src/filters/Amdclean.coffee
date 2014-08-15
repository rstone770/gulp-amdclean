_        = require 'underscore'
amdclean = require 'amdclean'
through  = require 'map-stream'

Filter = require './Filter'

module.exports =

  # simply wraps up amd clean into a filtered stream.
  class AmdcleanFilter extends Filter

    @gulp: (options, amdclean) ->
      filter = new AmdcleanFilter options, amdclean

      filter.stream()

    constructor: (@options = {}, @_amdclean = amdclean) ->
      super

    process: (data) ->
      options  = _.extend {}, @options,
        code: data.contents.toString()

      @_amdclean.clean options

