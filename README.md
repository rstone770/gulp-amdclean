gulp-amdclean [![Build Status](https://travis-ci.org/rstone770/gulp-amdclean.png?branch=master)](https://travis-ci.org/rstone770/gulp-amdclean) [![NPM version](https://badge.fury.io/js/gulp-amdclean.png)](http://badge.fury.io/js/gulp-amdclean)
====

A gulp plugin for the very awesome [amdclean](https://github.com/gfranko/amdclean). Now with 100% more amdclean.

# Use
After installing Just add it into your build chain via pipe.
 
```javscript
npm install gulp-amdclean
```
Then use the factory to return a nice amdclean filtered stream.
```javascript
var gulp      = require('gulp'),
    Amdclean  = require('gulp-amdclean');

gulp.tasks('build', ['lint', 'test'], function() {
  return gulp
    .src(['src/main.js'])
    .pipe(Amdclean.gulp({
      'prefixMode': 'standard'
      // some other options
    })
    .pipe(gulp.dest('./bin');
});
```

Because right now i have to manually update the amdclean dependency and that may be a slow process; the amdclean filter supports DI so you can
inject any version you need. Simply use the second argument to pass your own version of amdclean and your all set.

```javascript
var amdclean = require('amdclean'), // your amdclean
	filter 	 = require('gulp-amdclean').gulp(options, amdclean) // a filter with your options and amdclean.
```

Any option that you'd normally use with [amdclean](https://github.com/gfranko/amdclean) will work.

# Contrib

Commit anything you want within reason. Not sure what else is needed, but contribs are always welcome.