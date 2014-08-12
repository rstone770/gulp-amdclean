module.exports = 
  
  # Error thrown incase a filter has a method missing an implementation
  # 
  # @extends Error
  class NotImplementedError extends Error
    constructor: () ->
      super