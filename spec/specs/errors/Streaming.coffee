should = require('chai').should()

StreamingError = require "#{process.cwd()}/src/errors/Streaming"

describe 'errors/Streaming', ->

  streamingError = null

  beforeEach ->
    streamingError = new StreamingError

  describe '@', ->
    it 'should be an Error.', ->
      streamingError.should.be.instanceOf Error

    it 'should be an errors/Streaming.', ->
      streamingError.should.be.instanceOf StreamingError