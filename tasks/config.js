module.exports = {

  /**
   * Simply the contents of the package.json
   * 
   * @type {Object}
   */
  package: require(process.cwd() + '/package.json'),

  /**
   * Path hash that just contains any path that may be useful during any task or build.
   *  
   * @type {Object}
   */
  paths: {
    src: 'src/**/*.js',
    spec: 'spec/**/*.js',
    project: '*.js',
    tasks: 'tasks/**/*.js'
  },

  /**
   * Spec config.
   * 
   * @type {Object}
   */
  spec: {

    /**
     * Dep names for this task. What must be run before this task?
     * 
     * @type {Array<String>}
     */
    deps: ['lint'],

    /**
     * A more granular filter.
     * 
     * @type {Array<String>}
     */
    paths: ['spec/!fixtures'],

    /**
     * Any options needed to test.
     * 
     * @type {Object}
     */
    options: {}
  },

  /**
   * Linting config.
   * 
   * @type {Object}
   */
  lint: {
    deps: [],
    options: {}
  }
};