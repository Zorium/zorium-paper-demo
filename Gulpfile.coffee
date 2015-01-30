_ = require 'lodash'
gulp = require 'gulp'
concat = require 'gulp-concat'
nodemon = require 'gulp-nodemon'
rename = require 'gulp-rename'
clean = require 'gulp-clean'
sourcemaps = require 'gulp-sourcemaps'
runSequence = require 'gulp-run-sequence'
coffeelint = require 'gulp-coffeelint'
karma = require('karma').server
minifyCss = require 'gulp-minify-css'
mocha = require 'gulp-mocha'
RewirePlugin = require 'rewire-webpack'
webpack = require 'gulp-webpack'
webpackSource = require 'webpack'

karmaConf = require './karma.defaults'

paths =
  static: './src/static/**/*'
  scripts: ['./src/**/*.coffee', './*.coffee', './test/*/**/*.coffee']
  serverTests: './test/server.coffee'
  root: './src/root.coffee'
  rootTests: './test/index.coffee'
  dist: './dist/'
  build: './build/'

# start the dev server, and auto-update
gulp.task 'dev', ['assets:dev'], ->
  gulp.start 'server'

# compile sources: src/* -> build/*
gulp.task 'assets:dev', [
  'static:dev'
]

# compile sources: src/* -> dist/*
gulp.task 'assets:prod', [
  'scripts:prod'
  'static:prod'
]

# build for production
gulp.task 'build', (cb) ->
  runSequence 'clean:dist', 'assets:prod', cb

# tests
# process.exit is added due to gulp-mocha (test:server) hanging
gulp.task 'test', [
    'scripts:test'
    'test:server'
    'lint'
  ], (cb) ->
  karma.start _.defaults(singleRun: true, karmaConf), process.exit

# start the dev server
gulp.task 'server', ->
  # Don't actually watch for changes, just run the server
  nodemon {script: 'bin/dev_server.coffee', ext: 'null', ignore: ['**/*.*']}

# gulp-mocha will never exit on its own.
gulp.task 'test:server', ['scripts:test'], ->
  gulp.src paths.serverTests
    .pipe mocha()

gulp.task 'test:phantom', ['scripts:test'], (cb) ->
  karma.start _.defaults({
    singleRun: true,
    browsers: ['PhantomJS']
  }, karmaConf), cb

gulp.task 'scripts:test', ->
  gulp.src paths.rootTests
  .pipe webpack
    module:
      postLoaders: [
        { test: /\.coffee$/, loader: 'transform/cacheable?envify' }
      ]
      loaders: [
        { test: /\.coffee$/, loader: 'coffee' }
        { test: /\.json$/, loader: 'json' }
        {
          test: /\.styl$/
          loader: 'style/useable!css!stylus?paths=bower_components'
        }
      ]
    plugins: [
      new RewirePlugin()
    ]
    resolve:
      extensions: ['.coffee', '.js', '.json', '']
      # browser-builtins is for tests requesting native node modules
      modulesDirectories: ['web_modules', 'node_modules', './src',
      './node_modules/browser-builtins/builtin']
  .pipe rename 'bundle.js'
  .pipe gulp.dest paths.build + '/test/'


# run coffee-lint
gulp.task 'lint', ->
  gulp.src paths.scripts
    .pipe coffeelint()
    .pipe coffeelint.reporter()

gulp.task 'watch:test', ->
  gulp.watch paths.scripts, ['test:phantom']

gulp.task 'static:dev', ->
  gulp.src paths.static
    .pipe gulp.dest paths.build

#
# Production compilation
#

# rm -r dist
gulp.task 'clean:dist', ->
  gulp.src paths.dist, read: false
    .pipe clean()

# init.coffee --> dist/js/bundle.min.js
gulp.task 'scripts:prod', ->
  gulp.src paths.root
  .pipe webpack
    module:
      postLoaders: [
        { test: /\.coffee$/, loader: 'transform/cacheable?envify' }
      ]
      loaders: [
        { test: /\.coffee$/, loader: 'coffee' }
        { test: /\.json$/, loader: 'json' }
        {
          test: /\.styl$/
          loader: 'style/useable!css!stylus?paths=bower_components'
        }
      ]
    plugins: [
      new webpackSource.optimize.UglifyJsPlugin()
    ]
    resolve:
      extensions: ['.coffee', '.js', '.json', '']
  .pipe rename 'bundle.js'
  .pipe gulp.dest paths.dist + '/js/'

gulp.task 'static:prod', ->
  gulp.src paths.static
    .pipe gulp.dest paths.dist
