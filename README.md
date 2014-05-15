gulp-amdclean [![Build Status](https://travis-ci.org/rstone770/gulp-amdclean.png?branch=master)](https://travis-ci.org/rstone770/gulp-amdclean) [![NPM version](https://badge.fury.io/js/gulp-amdclean.png)](http://badge.fury.io/js/gulp-amdclean)
====

A gulp plugin for the very awesome [amdclean](https://github.com/gfranko/amdclean).

# Use
After installing Just add it into your build chain via pipe.
 
```javscript
npm install gulp-amdclean
```

```javascript
var gulp      = require('gulp'),
    amdclean  = require('gulp-amdclean');

gulp.tasks('build', ['lint', 'test'], function() {
  return gulp
    .src(['src/main.js'])
    .pipe(amdclean({
      'prefixMode': 'standard'
      // some other options
    })
    .pipe(gulp.dest('./bin');
});
```

Any option that youd normally use with [amdclean](https://github.com/gfranko/amdclean) will work.

# Setup

If for some reason you have the urge to hack on this lib simply use;
```javascript
npm install
gulp
```
Gulp needs to be globaly installed before hand.

# Contrib

Commit anything you want within reason. Not sure what else is needed, but contribs are always welcome.