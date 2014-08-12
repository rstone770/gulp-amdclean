var Filter, NotImplementedError, StreamingError, through,
  __slice = [].slice;

through = require('map-stream');

StreamingError = require('../errors/Streaming');

NotImplementedError = require('../errors/NotImplemented');

module.exports = Filter = (function() {
  function Filter() {}

  Filter.prototype.filter = function(data, next) {
    var filtered;
    if (data.isNull()) {
      return next(null, data);
    } else if (data.isStream()) {
      return next(new StreamingError);
    }
    filtered = this.process(data);
    data.contents = new Buffer(filtered);
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
        args = 1 <= arguments.length ? __slice.call(arguments, 0) : [];
        return _this.filter.apply(_this, args);
      };
    })(this));
  };

  return Filter;

})();
