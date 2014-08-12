should = require('chai').should()

NotImplementedError = require "#{process.cwd()}/src/errors/NotImplemented"

describe 'errors/NotImplemented', ->

  notImplementedError = null

  beforeEach ->
    notImplementedError = new NotImplementedError

  describe '@', ->
    it 'should be an Error.', ->
      notImplementedError.should.be.instanceOf Error

    it 'should be an errors/NotImplemented.', ->
      notImplementedError.should.be.instanceOf NotImplementedError