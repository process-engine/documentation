/**
 * Copyright (c) 2016 Kam Low
 *
 * @license MIT
 **/

var fs = require('fs'),
path = require('path'),
Promise = require('bluebird'),
tmp = require('tmp'),
grunt = require('grunt'),
package = require('./package'),
_ = require('lodash')
var program = require('commander');

program.usage('[options] <specfile>')
        .option('-t, --target-dir <dir>', 'the target build directory (default: public)', String)
        .option('-f, --target-file <file>', 'the target build HTML file (default: index.html)', String)
        .option('-a, --app-dir <dir>', 'the application source directory (default: app)', String)
        .option('-l, --logo-file <file>', 'specify a custom logo file (default: null)', String, null)
        .option('-c, --config-file <file>', 'specify a custom configuration file (default: app/lib/config.js)')
        .parse(process.argv)

// Show help if no specfile or options are specified
if (program.args.length < 1) { // && program.rawArgs.length < 1
  program.help()
}

program.specFile = program.args[0];


// Ensures temporary files are cleaned up on program close, even if errors are encountered.
tmp.setGracefulCleanup()

var defaults = {
  silent: false,
  targetDir: path.resolve(process.cwd(), 'public'),
  targetFile: 'index.html',
  appDir: path.resolve(__dirname, 'app'),
  configFile: path.resolve(__dirname, 'app/lib/config.js'),
  cacheDir: tmp.dirSync({ unsafeCleanup: true, prefix: 'spectacle-' }).name
};
function resolveOptions(options) {
  var opts = _.extend({}, defaults, options)

  // Replace some absolute paths
  if (opts.specFile && opts.specFile.indexOf('test/fixtures') === 0)
      opts.specFile = path.resolve(__dirname, opts.specFile)
  if (opts.logoFile && opts.logoFile.indexOf('test/fixtures') === 0)
      opts.logoFile = path.resolve(__dirname, opts.logoFile)

  return opts;
}

/**
* Run Spectacle and configured tasks
**/
spectacle = function (options) {
  var opts = resolveOptions(options)

  function loadData() {
      var specPath = path.resolve(opts.specFile)
      delete require.cache[specPath];
      return require(path.resolve(opts.appDir + '/lib/preprocessor'))(
                                  options, require(specPath))
  }

  var config = require(path.resolve(opts.configFile))(grunt, opts, loadData())

  grunt.initConfig(_.merge({ pkg: package }, config))
  if(opts.silent) {
      grunt.log.writeln = function() {}
      grunt.log.write = function() {}
      grunt.log.header = function() {}
      grunt.log.ok = function() {}
  }

  var cwd = process.cwd() // change CWD for loadNpmTasks global install
  var exists = grunt.file.exists(path.join(path.resolve('node_modules'),
                                          'grunt-contrib-concat',
                                          'package.json'))
  if (!exists)
      process.chdir(__dirname)

  grunt.loadNpmTasks('grunt-contrib-concat')
  grunt.loadNpmTasks('grunt-contrib-uglify')
  grunt.loadNpmTasks('grunt-contrib-cssmin')
  grunt.loadNpmTasks('grunt-contrib-clean')
  grunt.loadNpmTasks('grunt-contrib-copy')
  grunt.loadNpmTasks('grunt-compile-handlebars')
  grunt.loadNpmTasks('grunt-prettify')
  grunt.loadNpmTasks('grunt-sass')

  process.chdir(cwd)

  grunt.registerTask('predentation', 'Remove indentation from generated <pre> tags.', function() {
      var html = fs.readFileSync(opts.cacheDir + '/' + opts.targetFile, 'utf8')
      html = html.replace(/<pre.*?><code.*?>([\s\S]*?)<\/code><\/pre>/gmi, function(x, y) {
        var lines = x.split('\n'), level = null;
        if (lines) {

          // Determine the level of indentation
          lines.forEach(function(line) {
            if (line[0] === '<') return;
            var wsp = line.search(/\S/)
            level = (level === null || (wsp < line.length && wsp < level)) ? wsp : level;
          })

          // Remove indentation
          var regex = new RegExp('^\\s{' + level + '}')
          lines.forEach(function(line, index, lines) {
            lines[index] = line.replace(regex, '')
          })
        }
        return lines.join('\n')
      })
      fs.writeFileSync(opts.cacheDir + '/' + opts.targetFile, html)
  })

  grunt.registerTask('stylesheets', ['sass:scss', 'concat:css', 'cssmin'])
  grunt.registerTask('javascripts', ['concat:js', 'uglify'])
  grunt.registerTask('templates', ['clean:html', 'load-minified-files', 'compile-handlebars', 'predentation', 'prettify', 'clean:assets'])
  grunt.registerTask('foundation', ['sass:foundation_scss', 'concat:foundation_css']) // 'concat:foundation_js'
  grunt.registerTask('default', ['stylesheets', 'javascripts', 'foundation', 'templates'])

  // Report, etc when all tasks have completed.
  var donePromise = new Promise(function(resolve, reject) {
    grunt.task.options({
      error: function(e) {
        if(!opts.silent) {
            console.warn('Task error:', e)
        }
        // TODO: fail here or push on?
        reject(e)
      },
      done: function() {
        if(!opts.silent) {
            console.log('All tasks complete')
        }
        resolve()
      }
    })
  })

  grunt.task.run(['foundation', 'stylesheets'])
  grunt.task.run('javascripts')
  if (opts.logoFile) {
      grunt.task.run('copy:logo')
  }

  grunt.task.run('templates')
  grunt.task.start()

  return donePromise;
};

spectacle(program)

