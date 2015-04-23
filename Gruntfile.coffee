'use strict'

module.exports = (grunt) ->

  require 'coffee-errors'

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-notify'
  grunt.loadNpmTasks 'grunt-coffee-react'

  grunt.registerTask 'build', [ 'cjsx' ]
  grunt.registerTask 'default', [ 'build', 'watch' ]

  grunt.initConfig

    cjsx:
      compile:
        options:
          sourceMap: true
        files:
          'lib/main.js': [ 'src/*.cjsx' ]

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
