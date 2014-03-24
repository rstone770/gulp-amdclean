module.exports = {

  /**
   * Thrown in the case that a streaming type context is passed to amdclean.
   * 
   * @type {Error}
   */
  Streaming: new Error('Streaming content is not supported.')
};