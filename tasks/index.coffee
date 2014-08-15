_    = require 'underscore'
glob = require 'glob'
gulp = require 'gulp'

config = require './config'

loadTask = (file, extra...) ->
  module = require file

  module.apply(null, extra) if _.isFunction module

loadTasks = (path, gulp, config = {}) ->
  files = glob.sync path

  for file in files
    loadTask file, gulp, config

loadTasks "#{__dirname}/filters/*.coffee", gulp, config