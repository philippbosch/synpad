module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'

    clean: ['dist', 'build']

    coffee:
      compile:
        files:
          'build/javascripts/app.js': ['javascripts/*.coffee']

    concat:
      dist:
        files:
          'build/javascripts/app.combined.js': [
            'public/components/jquery/jquery.js',
            'public/components/codemirror/lib/codemirror.js',
            'public/components/codemirror/mode/markdown/markdown.js',
            'public/components/angular/angular.js',
            'public/components/angular-resource/angular-resource.js',
            'public/components/angular-storage/dist/angular-storage.js',
            'public/components/angular-ui-router/release/angular-ui-router.js',
            'public/components/angular-ui-codemirror/ui-codemirror.js',
            'public/components/firebase/lib/firebase.js',
            'public/components/firepad/dist/firepad.js',
            'public/components/angularfire/angularfire.js',
            'public/components/bootstrap/dist/js/bootstrap.js',
            'public/components/showdown/src/showdown.js',
            'build/javascripts/app.js'
          ]

    uglify:
      dist:
        files:
          'dist/javascripts/app.min.js': 'build/javascripts/app.combined.js'

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

  grunt.registerTask 'default', ['clean', 'coffee', 'concat', 'uglify', 'compass', 'cssmin', 'targethtml', 'copy']
  grunt.registerTask 'deploy', ['default', 'rsync']
