var cwd       = process.cwd(),
    Readable  = require('stream').Readable,
    Vinyl     = require('vinyl'),
    should    = require('chai').should(),
    amdclean  = require('amdclean'),
    clean     = require(cwd + '/src/gulp-amdclean');

describe('src/gulp-amdclean', function() {
  var sandbox, stream;

  beforeEach(function() {
    stream = function() {
      var stream = new Readable();

      stream._read = function() {
        this
          .push('ronnie')
          .push(null);
      };

      return stream;
    };

    sandbox = {
      'null': new Vinyl({
        cwd: '/cute',
        base: '/cute/ronnie',
        path: '/cute/ronnie/cat.js',
        contents: null,
      }),

      'data': new Vinyl({
        cwd: '/',
        base: '/',
        path: '/',
        contents: new Buffer('define("namespace/module", ["./module1", "../,module2"], function(module1, module2) {return [module1, module2]});')
      }),

      'stream': new Vinyl({
        cwd: '/',
        base: '/',
        path: '/',
        contents: stream()
      })
    };
  });

  it('Should not agument(filter) a null content stream.', function(done) {
    var stream = clean();

    stream.on('data', function(data) {
      should.exist(data.cwd);
      should.exist(data.base);
      should.exist(data.path);

      should.not.exist(data.contents);

      done();
    });

    stream.write(sandbox.null);
  });

  it('Should throw an Error on streaming content.', function(done) {
    var stream = clean();

    stream.on('data', function() {
      done(new Error('Should not call data.'));
    })
    .on('error', function(error) {
      error.should.be.instanceOf(Error);

      done();
    });

    stream.write(sandbox.stream);
  });

  it('Should augment(filter) a non null content stream.', function(done) {
    var stream = clean();

    stream.on('data', function(data) {
      should.exist(data.cwd);
      should.exist(data.base);
      should.exist(data.path);

      var expected = amdclean.clean({
        code: sandbox.data.contents
      });

      data
        .contents
        .toString()
        .should.equals(expected);

      done();
    });

    stream.write(sandbox.data);
  });
});