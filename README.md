gulp-amdclean [![Build Status](https://travis-ci.org/rstone770/gulp-amdclean.png?branch=master)](https://travis-ci.org/rstone770/gulp-amdclean) [![NPM version](https://badge.fury.io/js/gulp-amdclean.png)](http://badge.fury.io/js/gulp-amdclean)
====

A very simple streaming adapter for the very awesome [amdclean](https://github.com/gfranko/amdclean).

# Use

if you are having issues, and its not resolved just let me know. I have 3 devices wired into github, so chances are i'll get something unless I get tired of you.

Installation of this gulp piece could not be more simple. 
```javscript
npm install gulp-amdclean
```

Simply 'pop' it into your gulp pipeline along with any options you would normally use for [amdclean](https://github.com/gfranko/amdclean).

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

If your thinking about any of this, let me know. This segment should be another mindless blop in the pipline. This is supposed to be easy god damnit.

# Setup

If for some reason you have the urge to hack on this lib simply use;
```javascript
npm install gulp -g && npm install && gulp
```
the only thing really needed here is gulp as long as the first 2 command are run before hand.

# Contrib

Commit anything you want within reason. Not sure what else is needed, but contribs are always welcome.