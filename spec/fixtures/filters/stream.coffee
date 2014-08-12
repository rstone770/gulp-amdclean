Vinyl     = require 'vinyl'
Stream    = require 'stream'

module.exports = () ->
  new Vinyl
    contents: new Stream