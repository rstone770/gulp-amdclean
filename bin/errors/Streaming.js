var StreamingError,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

module.exports = StreamingError = (function(superClass) {
  extend(StreamingError, superClass);

  function StreamingError() {
    StreamingError.__super__.constructor.apply(this, arguments);
  }

  return StreamingError;

})(Error);
