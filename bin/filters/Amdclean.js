var AmdcleanFilter, Filter, amdclean, through, _,
  __hasProp = {}.hasOwnProperty,
  __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

_ = require('underscore');

amdclean = require('amdclean');

through = require('map-stream');

Filter = require('./Filter');

module.exports = AmdcleanFilter = (function(_super) {
  __extends(AmdcleanFilter, _super);

  AmdcleanFilter.gulp = function(options, amdclean) {
    var filter;
    filter = new AmdcleanFilter(options, amdclean);
    return filter.stream();
  };

  function AmdcleanFilter(options, _amdclean) {
    this.options = options != null ? options : {};
    this._amdclean = _amdclean != null ? _amdclean : amdclean;
    AmdcleanFilter.__super__.constructor.apply(this, arguments);
  }

  AmdcleanFilter.prototype.process = function(data) {
    var options;
    options = _.extend({}, this.options, {
      code: data.contents.toString()
    });
    if (data.sourceMap) {
      options.sourceMap = data.sourceMap;
      options.esprima = options.esprima || {};
      options.esprima.source = data.relative;
      options.escodegen = options.escodegen || {};
      options.escodegen.sourceMap = true;
      options.escodegen.sourceMapWithCode = true;
    }
    return this._amdclean.clean(options);
  };

  return AmdcleanFilter;

})(Filter);
