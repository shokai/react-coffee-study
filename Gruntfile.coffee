'use strict'

module.exports = (grunt) ->

  require 'coffee-errors'

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-notify'
  grunt.loadNpmTasks 'grunt-browserify'

  grunt.registerTask 'build',   [ 'browserify' ]
  grunt.registerTask 'default', [ 'build', 'watch' ]

  grunt.initConfig

    pkg: grunt.file.readJSON 'package.json'

    browserify:
      build:
        options:
          browserifyOptions:
            transform: [
              'coffee-reactify'
            ]
            debug: process.env.NODE_ENV isnt 'production'
        files:
          'lib/main.js': [ 'src/*.{cjsx,coffee}' ]

    watch:
      options:
        interrupt: yes
      dist:
        files: [
          '**/*.{coffee,cjsx}'
          '!*#*'
          '!lib/**'
          '!node_modules/**'
        ]
        tasks: [ 'build' ]
