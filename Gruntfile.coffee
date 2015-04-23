'use strict'

module.exports = (grunt) ->

  require 'coffee-errors'

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-notify'
  grunt.loadNpmTasks 'grunt-coffee-react'
  grunt.loadNpmTasks 'grunt-browserify'

  grunt.registerTask 'build',   [ 'cjsx', 'browserify' ]
  grunt.registerTask 'default', [ 'build', 'watch' ]

  grunt.initConfig

    cjsx:
      compile:
        options:
          sourceMap: true
        files:
          'tmp/js/main.js': [ 'src/*.cjsx' ]

    browserify:
      dist:
        files:
          'lib/main.js': [ 'tmp/js/main.js' ]

    watch:
      options:
        interrupt: yes
      dist:
        files: [
          '**/*.{coffee,cjsx}'
          '!lib/**'
          '!node_modules/**'
        ]
        tasks: [ 'build' ]
