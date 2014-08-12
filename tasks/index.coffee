_    = require 'underscore'
glob = require 'glob'
gulp = require 'gulp'

config = require './config'

# Loads a single file and applys an extra arguments directly to the export if its a function
# 
# @param {!String} file
# @param {*...}    extra
loadTask = (file, extra...) ->
  module = require file

  module.apply(null, extra) if _.isFunction module

# Loads all tasks in path.
# 
# @param {!String} path Path to query tasks.
# @parm  {!Gulp}   gulp
# @parm  {Object=} config Options that will be sent through to each filter.
loadTasks = (path, gulp, config = {}) ->
  files = glob.sync path

  for file in files
    loadTask file, gulp, config

loadTasks "#{__dirname}/filters/*.coffee", gulp, config