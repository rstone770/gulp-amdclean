_        = require 'underscore'
amdclean = require 'amdclean'
through  = require 'map-stream'

Filter = require './Filter'

module.exports =

  class AmdcleanFilter extends Filter

    # Factory that just returns a filter for gulp to use.
    # 
    # @param    {Object=}  options
    # @param    {Amdclean} amdclean
    # @returns  {!Stream}
    @gulp: (options, amdclean) ->
      filter = new AmdcleanFilter options, amdclean

      filter.stream()

    # @param {Object=}   options  These get passed directly to amd clean.
    # @param {Amdclean=} amdclean If provided, filter will use this instance of amdclean.
    constructor: (@options = {}, @_amdclean = amdclean) ->
      super

    # Processes the data stream.
    # 
    # @param   {!Object} data
    # @returns {!String}
    process: (data) ->
      options  = _.extend {}, @options, 
        code: data.contents.toString()

      @_amdclean.clean options

