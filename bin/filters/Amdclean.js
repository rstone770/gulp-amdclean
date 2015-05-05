var AmdcleanFilter, Filter, _, amdclean, through,
  extend = function(child, parent) { for (var key in parent) { if (hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; },
  hasProp = {}.hasOwnProperty;

_ = require('underscore');

amdclean = require('amdclean');

through = require('map-stream');

Filter = require('./Filter');

module.exports = AmdcleanFilter = (function(superClass) {
  extend(AmdcleanFilter, superClass);

  AmdcleanFilter.gulp = function(options, amdclean) {
    var filter;
    filter = new AmdcleanFilter(options, amdclean);
    return filter.stream();
  };

  function AmdcleanFilter(options1, _amdclean) {
    this.options = options1 != null ? options1 : {};
    this._amdclean = _amdclean != null ? _amdclean : amdclean;
    AmdcleanFilter.__super__.constructor.apply(this, arguments);
  }

  AmdcleanFilter.prototype.process = function(data) {
    var options;
    options = _.extend({}, this.options, {
      code: data.contents.toString()
    });
    if (data.sourceMap) {
      if (!!options.wrap) {
        throw new Error('Wrap parameter should not be used ' + 'together with source maps');
      }
      options.sourceMap = data.sourceMap;
      options.esprima = options.esprima || {};
      options.esprima.source = data.relative;
      options.escodegen = options.escodegen || {};
      options.escodegen.sourceMap = true;
      options.escodegen.sourceMapWithCode = true;
      options.wrap = false;
    }
    return this._amdclean.clean(options);
  };

  return AmdcleanFilter;

})(Filter);
