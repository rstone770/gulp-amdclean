Vinyl     = require 'vinyl'

module.exports = (contents) ->
  contents = '
    define("namespace/module", [
      "./module1",
      "../,module2"
    ], function(module1, module2) {
      return [module1, module2]
    });' unless contents?
  
  new Vinyl
    contents: new Buffer contents