var underscore = require('underscore'),
    amdclean   = require('amdclean'),
    through    = require('map-stream'),
    errors     = require('./errors');

module.exports = function(options) {

  /**
   * amdclean stream filter.
   *
   * @throws {errors.Streaming} If data is streaming.
   * 
   * @param  {data} data 
   * @param  {Function} next
   */
  var clean = function(data, next) {
    if(data.isNull()) {
      next(null, data);
      
      return next();
    } else if(data.isStream()) {
      return next(errors.Streaming);
    }

    var config = underscore.extend(options || {}, {
      code: data.contents.toString()
    });

    data.contents = new Buffer(amdclean.clean(config));

    return next(null, data);
  };

  return through(clean);
};