var path = require('path');
var fs = require('fs');

module.exports = function(grunt, options, spec) {
  
  grunt.registerTask('load-minified-files', null, () => {
    grunt.file.write(`${options.targetDir}/sources.json`, JSON.stringify(Object.assign(spec, {
      foundation_css: grunt.file.read(`${options.targetDir}/stylesheets/foundation.min.css`).replace('@charset "UTF-8";', ''),
      spectacle_css: grunt.file.read(`${options.targetDir}/stylesheets/spectacle.min.css`).replace('@charset "UTF-8";', ''),
      spectacle_js: grunt.file.read(`${options.targetDir}/javascripts/spectacle.min.js`).replace('@charset "UTF-8";', ''),
    })));
  });

  return {

    // Compile SCSS source files into the cache directory
    sass: {
      options: {
        includePaths: [
          options.appDir + '/vendor',
          options.appDir + '/vendor/foundation/scss'
        ]
      },
      scss: {
        files: {
          [path.resolve(options.cacheDir, 'stylesheets/spectacle.css')]: path.resolve(options.appDir, 'stylesheets/spectacle.scss')
        }
      },
      foundation_scss: {
        files: {
          [path.resolve(options.cacheDir, 'stylesheets/foundation.css')]: path.resolve(options.appDir, 'stylesheets/foundation-includes.scss')
        }
      },
    },

    // Concentrate JS files into a single source
    concat: {

      // Concentrate source JS files from the directory into the traget directory
      js: {
        src: [options.appDir + '/javascripts/**/*.js', '!' + options.appDir + '/javascripts/jquery*.js'],
        dest: options.targetDir + '/javascripts/spectacle.js',
      },

      // Concentrate compiled CSS files into the traget directory
      css: {
        src: [options.cacheDir + '/stylesheets/spectacle.css'],
        dest: options.targetDir + '/stylesheets/spectacle.css',
      },

      // Concentrate compiled Foundation CSS files into the traget directory
      foundation_css: {
        src: [options.cacheDir + '/stylesheets/foundation.css'],
        dest: options.targetDir + '/stylesheets/foundation.css',
      }
    },

    // Minify compiled JS files in the traget directory
    uglify: {
      js: {
        src: options.targetDir + '/javascripts/spectacle.js',
        dest: options.targetDir + '/javascripts/spectacle.min.js'
      }
    },

    // Minify compiled CSS files in the traget directory
    cssmin: {
      minify: {
        expand: true,
        cwd: options.targetDir + '/stylesheets',
        src: ['*.css', '!*.min.css'],
        dest: options.targetDir + '/stylesheets',
        ext: '.min.css'
      }
    },

    // Compile the Handlebars templates as HTML into the target directory
    'compile-handlebars': {
      compile: {
        files: [{
          src: options.appDir + '/views/' + (options.embeddable ? 'embedded.hbs' : 'main.hbs'),
          dest: options.cacheDir + '/' + options.targetFile
        }],
        templateData: `${options.targetDir}/sources.json`,
        helpers: options.appDir + '/helpers/*.js',
        partials: options.appDir + '/views/partials/**/*.hbs'
      },
    },

    // Prettify generated HTML output
    prettify: {
      options: {
        preserve_newlines: false,
        unformatted: ['code', 'pre', 'style', 'script']
      },
      index: {
        src: options.cacheDir + '/' + options.targetFile,
        dest: options.targetDir + '/' + options.targetFile // copy to destination
      }
    },

    // Cleanup cache and traget files
    clean: {
      options: {
        force: true
      },
      cache: [options.cacheDir],
      assets: [options.targetDir + '/stylesheets/**/*.css', options.targetDir + '/javascripts/**/*.js'],
      html: [options.cacheDir + '/**/*.html', options.targetDir + '/**/*.html'],
    },
    
    // Copy files to the target directory
    copy: {
      logo: {
        src: options.logoFile,
        dest: options.targetDir + '/images/' + path.basename(options.logoFile || '')
      }
    },
  }
}
