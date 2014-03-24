var cwd    = process.cwd(),
    should = require('chai').should(),
    errors = require(cwd + '/src/errors');

describe('src/errors', function() {
  describe('@@Streaming', function() {
    it('Should exist.', function() {
      should.exist(errors.Streaming);
    });

    it('Should be an Error.', function() {
      errors.Streaming.should.be.instanceOf.Error;
    });
  });
});