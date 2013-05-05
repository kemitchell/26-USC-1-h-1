{spawn} = require 'child_process'
glob = require 'glob'

option '-w', '--watch', 'watch files for changes'

launch = (cmd, options=[], callback) ->
  app = spawn cmd, options
  app.stdout.pipe process.stdout
  app.stderr.pipe process.stderr
  app.on 'exit', (status) -> callback?() if status is 0

COFFEE = 'node_modules/coffee-script/bin/coffee'

task 'build', 'Translate CoffeeScript source files', (options) ->
  args = ['-c', '-o', 'lib', '-b', 'src']
  args.unshift '-w' if !!options.watch
  launch COFFEE, args

DOCCO = 'node_modules/docco/bin/docco'

task 'docs', 'generate documentation', (options) ->
  glob 'src/*.coffee', (err, files) ->
    launch DOCCO, files

MOCHA = 'node_modules/mocha/bin/mocha'

task 'test', 'run tests', (options) ->
  glob "test/*_test.coffee", (err, files) ->
    files.unshift '-w' if !!options.watch
    files.unshift 'coffee:coffee-script'
    files.unshift '--compilers'
    files.unshift '--colors'
    app = launch MOCHA, files
