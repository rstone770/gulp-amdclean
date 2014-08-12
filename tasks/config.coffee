module.exports = 
  
  default:
    deps: ['coffee']

  # Test options
  spec:
    paths: ["#{process.cwd()}/spec/specs/**/*.coffee"]

    options: 
      reporter: 'dot'

  # Coffee compiler options
  coffee:
    paths: ["#{process.cwd()}/src/**/*.coffee"]

    options:
      bare: true

    deps: ['spec']

    out: "#{process.cwd()}/bin" 