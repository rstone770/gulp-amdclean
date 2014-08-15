should = require('chai').should()
Stream = require 'stream'

empty     = require '../../fixtures/filters/empty'
stream    = require '../../fixtures/filters/stream'
buffered  = require '../../fixtures/filters/buffered'

Filter              = require "#{process.cwd()}/src/filters/Filter"
StreamingError      = require "#{process.cwd()}/src/errors/Streaming"
NotImplementedError = require "#{process.cwd()}/src/errors/NotImplemented"

describe 'filters/Filter', ->
  filter = null

  beforeEach ->
    filter = new Filter

  describe 'process', ->
    it 'should throw an errors/NotImplemented.', ->
      filter.process.should.throw NotImplementedError

  describe 'stream', ->
    it 'should return a Stream.', ->
      filter.stream().should.be.instanceOf Stream

    it 'should filter through @process.', (done) ->
      filter.process = () ->
        return 'data'

      filter.stream().on 'data', (data) ->
        data.contents.toString().should.equal 'data'

        done()

      filter.stream().write buffered()

    it 'should always return the same stream.', ->
      filter.stream().should.equal filter.stream()

  describe 'filter', ->
    it 'should do nothing to empty buffers.', (done) ->
      filter.stream().on 'data', (data) ->
        should.not.exist data.contents

        done()

      filter.stream().write empty()

    it 'should throw a errors/Streaming Exception on Streams.', (done) ->
      filter.stream().on 'error', (error) ->
        error.should.be.instanceOf StreamingError

        done()

      filter.stream().write stream()
