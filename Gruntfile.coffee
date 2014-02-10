module.exports = (grunt) ->
  grunt.loadNpmTasks 'grunt-bower-install'
  grunt.loadNpmTasks 'grunt-bower-concat'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-connect'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-compress'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-shell'
  grunt.loadNpmTasks 'grunt-targethtml'

  grunt.registerTask 'default', ['clean', 'bower_concat', 'coffee', 'concat', 'uglify', 'compass', 'cssmin', 'targethtml', 'copy']
  grunt.registerTask 'dist', ['default']
  grunt.registerTask 'deploy', ['dist', 'shell:pushToDokku']
  grunt.registerTask 'serve', ['default', 'connect']

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'


    'bower_concat':
      all:
        dest: 'build/javascripts/components.js'

    'bower-install':
      target:
        src: ['public/index.html']
        ignorePath: 'public'

    'clean':
      ['dist', 'build']

    'coffee':
      compile:
        files:
          'build/javascripts/app.js': ['javascripts/**/*.coffee']

    'compass':
      dist:
        options:
          config: 'compass.config'
          cssDir: 'build/stylesheets'
          fontsDir: 'fonts'
          imagesDir: 'images'

    'concat':
      dist:
        files:
          'build/javascripts/combined.js': [
            'build/javascripts/components.js',
            'public/components/codemirror/mode/markdown/markdown.js',
            'build/javascripts/app.js'
          ]

    'connect':
      server:
        options:
          port: 8888
          base: 'dist'
          keepalive: true
          open: true

    'copy':
      dist:
        files: [
          {cwd: 'public/partials/', expand: true, src: '**', dest: 'dist/partials/'}
        ]

    'cssmin':
      dist:
        files:
          'dist/stylesheets/screen.min.css': [
            'public/components/bootstrap/dist/css/bootstrap.css',
            'public/components/bootstrap/dist/css/bootstrap-theme.css',
            'public/components/codemirror/lib/codemirror.css',
            'build/stylesheets/screen.css'
          ]

    'shell':
      pushToDokku:
        options:
          stdout: true
          stderr: true
        command: 'git push dokku master'

    'targethtml':
      dist:
        files:
          'dist/index.html': ['public/index.html']

    'uglify':
      dist:
        files:
          'dist/javascripts/app.min.js': 'build/javascripts/combined.js'
