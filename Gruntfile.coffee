module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    clean: ['dist', 'build']

    coffee:
      compile:
        files:
          'build/javascripts/app.js': ['javascripts/*.coffee']

    bower_concat:
      all:
        dest: 'build/javascripts/components.js'

    concat:
      dist:
        files:
          'build/javascripts/combined.js': [
            'build/javascripts/components.js',
            'public/components/codemirror/mode/markdown/markdown.js',
            'build/javascripts/app.js'
          ]

    uglify:
      dist:
        files:
          'dist/javascripts/app.min.js': 'build/javascripts/combined.js'

    compass:
      dist:
        options:
          config: 'compass.config'
          cssDir: 'build/stylesheets'
          fontsDir: 'fonts'
          imagesDir: 'images'

    cssmin:
      dist:
        files:
          'dist/stylesheets/screen.min.css': [
            'public/components/bootstrap/dist/css/bootstrap.css',
            'public/components/bootstrap/dist/css/bootstrap-theme.css',
            'public/components/codemirror/lib/codemirror.css',
            'build/stylesheets/screen.css'
          ]

    targethtml:
      dist:
        files:
          'dist/index.html': ['public/index.html']

    copy:
      dist:
        files: [
          {cwd: 'public/partials/', expand: true, src: '**', dest: 'dist/partials/'}
        ]

    rsync:
      dist:
        options:
          src: './dist/'
          dest: 'public_html'
          host: 'synpad@synpad.static.syntop.io'
          recursive: true

    'bower-install':
      target:
        src: ['public/index.html']
        ignorePath: 'public'


  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-targethtml'
  grunt.loadNpmTasks 'grunt-rsync'
  grunt.loadNpmTasks 'grunt-contrib-compress'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-bower-install'
  grunt.loadNpmTasks 'grunt-bower-concat'

  grunt.registerTask 'default', ['clean', 'bower_concat', 'coffee', 'concat', 'uglify', 'compass', 'cssmin', 'targethtml', 'copy']
  grunt.registerTask 'deploy', ['default', 'rsync', 'clean']
