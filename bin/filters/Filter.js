var Filter, NotImplementedError, StreamingError, through, vinylSourcemapsApply,
  slice = [].slice;

through = require('map-stream');

StreamingError = require('../errors/Streaming');

NotImplementedError = require('../errors/NotImplemented');

vinylSourcemapsApply = require('vinyl-sourcemaps-apply');

module.exports = Filter = (function() {
  function Filter() {}

  Filter.prototype.filter = function(data, next) {
    var filtered, map;
    if (data.isNull()) {
      return next(null, data);
    } else if (data.isStream()) {
      return next(new StreamingError);
    }
    filtered = this.process(data);
    if (!!filtered.code) {
      data.contents = new Buffer(filtered.code);
      if (data.sourceMap) {
        map = JSON.parse(filtered.map.toString());
        map.file = data.relative;
        vinylSourcemapsApply(data, map);
      }
    } else {
      data.contents = new Buffer(filtered);
    }
    return next(null, data);
  };

  Filter.prototype.process = function(data) {
    throw new NotImplementedError;
  };

  Filter.prototype.stream = function() {
    if (this._stream != null) {
      return this._stream;
    }
    return this._stream = through((function(_this) {
      return function() {
        var args;
        args = 1 <= arguments.length ? slice.call(arguments, 0) : [];
        return _this.filter.apply(_this, args);
      };
    })(this));
  };

  return Filter;

})();
