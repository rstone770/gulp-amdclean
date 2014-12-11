should    = require('chai').should()
amdclean  = require 'amdclean'
Stream    = require 'stream'

input   = require '../../fixtures/filters/buffered'
inputSM = require '../../fixtures/filters/sourcemap'

Filter          = require "#{process.cwd()}/src/filters/Filter"
AmdcleanFilter  = require "#{process.cwd()}/src/filters/Amdclean"

describe 'filters/Amdclean', ->
  filter = null

  beforeEach ->
    filter = new AmdcleanFilter

  describe '@', ->
    it 'should be instance of filters/Filter.', ->
      filter.should.be.instanceOf Filter

  describe '@gulp', ->
    it 'should return a stream.', ->
      AmdcleanFilter.gulp().should.be.instanceOf Stream

  describe 'process', ->
    it 'should process buffer through amdclean.', ->
      result = filter.process input()

      result.should.equal amdclean.clean code: input().contents.toString()

    it 'should pass through any options to amdclean.', ->
      filter = new AmdcleanFilter
        wrap:
          start: 'start'
          end: 'end'

      result = filter.process input(' ')

      result.should.equal 'startend'

    it 'should use optional amdclean instance if given.', ->
      amdclean =
        clean: (options) ->
          return 'transformed'

      filter = new AmdcleanFilter null, amdclean

      result = filter.process input()

      result.should.equal 'transformed'

  describe 'sourcemaps', ->
    inSM = inputSM()
    it 'should process buffer through amdclean with sourcemaps.', (done) ->
      filter.stream().on 'data', (data) ->
        data.contents.toString().should.equal inSM.expected.code
        data.sourceMap.mappings.should.equal inSM.expected.mappings
        data.sourceMap.sources.should.deep.equal inSM.expected.sources
        done()

      filter.stream().write inSM.file

    it 'should throw an error when wrap is used with sourcemaps', (done) ->
      filter = new AmdcleanFilter {wrap: {start: 'foo', end: 'bar'}}
      filter.stream().on 'data', (data) ->
        done(new Error('This should never happen'))

      filter.stream().on 'error', (e) ->
        e.message.should.contain 'Wrap parameter'
        done()

      filter.stream().write inSM.file
