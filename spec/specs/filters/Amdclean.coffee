should    = require('chai').should()
amdclean  = require 'amdclean'
Stream    = require 'stream'

input  = require '../../fixtures/filters/buffered'

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