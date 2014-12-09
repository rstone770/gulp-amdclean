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

      # if file has sourceMap property it means user had set up gulp-sourcemaps
      if data.sourceMap
        # TODO remove the wrap check when
        # https://github.com/gfranko/amdclean/issues/71 will be fixed
        if (!!options.wrap)
          throw new Error('Wrap parameter should not be used ' +
            'together with source maps')
        options.sourceMap = data.sourceMap
        options.esprima = options.esprima || {}
        options.esprima.source = data.relative
        options.escodegen = options.escodegen || {}
        options.escodegen.sourceMap = true
        options.escodegen.sourceMapWithCode = true
        options.wrap = false

      @_amdclean.clean options

