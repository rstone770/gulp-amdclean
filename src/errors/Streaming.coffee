module.exports = 
  
  # Error thrown incase a filter is used in streaming mode instead of chucked
  # 
  # @extends Error
  class StreamingError extends Error
    constructor: () ->
      super