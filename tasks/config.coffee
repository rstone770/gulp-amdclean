module.exports =

  default:
    deps: ['coffee']

  spec:
    paths: ["#{process.cwd()}/spec/specs/**/*.coffee"]

    options:
      reporter: 'dot'

  coffee:
    paths: ["#{process.cwd()}/src/**/*.coffee"]

    options:
      bare: true

    deps: ['lint', 'spec']

    out: "#{process.cwd()}/bin"

  lint:
    paths: ["#{process.cwd()}/{src,tasks,spec}/**/*.coffee"]