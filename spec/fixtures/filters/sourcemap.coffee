Vinyl = require 'vinyl'

module.exports = (contents, sourceMap) ->
  contents = [
    "define('b',[], function() {",
    "    return 'b';", "});",
    "define('a',['b'], function(b) {",
    "    return 'a' + b;",
    "});"
  ].join('\n') unless contents?

  sourceMap = {
    "version": 3,
    "file": "a-built.js",
    "sources": [
      "b.js",
      "a.js"
    ],
    "names": [],
    "mappings": "AAAA;AACA;AACA;ACFA,ADGA;ACFA;AACA;AACA",
    "sourcesContent": [
      "define('b',[], function() {\n    return 'b';\n});\n",
      "define('a',['b'], function(b) {\n    return 'a' + b;\n});\n"
    ]
  } unless sourceMap?

  file = new Vinyl
    contents: new Buffer contents
    path: sourceMap.file

  file.sourceMap = sourceMap

  return {
    file: file
    expected: {
      code: "var b, a;\nb = 'b';\na = 'a' + b;",
      mappings: "SAAA;AAAAA,CAAA,GACA,GADA;ACAAC,CAAA,GACA,MAAAD,CADA"
      sources: ['b.js', 'a.js']
    }
  }
