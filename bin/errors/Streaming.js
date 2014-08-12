var StreamingError,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

module.exports = StreamingError = (function(_super) {
  __extends(StreamingError, _super);

  function StreamingError() {
    StreamingError.__super__.constructor.apply(this, arguments);
  }

  return StreamingError;

})(Error);
