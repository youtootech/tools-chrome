# Generic processing function
process = (src, path) ->
  console.log "Processing file: #{path}"
  return "/** Source File: #{path} **/ \n#{src}\n"


module.exports = (grunt) ->
  JS = 'lib/js'
  BOWER = "bower_components"
  BUILD = "build"
  PUBLIC = "lib"

  grunt.initConfig
    pkg: grunt.file.readJSON 'package.json'
    manifest: grunt.file.readJSON 'manifest.json'
    bower: grunt.file.readJSON 'bower.json'
    bump:
      options:
        files: ['package.json', 'bower.json', 'manifest.json']
        updateConfigs: ['pkg']
        commitMessage: "Version %VERSION% built on #{grunt.template.today('yyyy-mm-dd')} at #{grunt.template.today('hh:MM:ss TT')}"
        commitFiles: ['package.json', 'bower.json', 'manifest.json']
        createTag: true
        tagName: 'v%VERSION%'
        tagMessage: "Version %VERSION% built on #{grunt.template.today('yyyy-mm-dd')} at #{grunt.template.today('hh:MM:ss TT')}"
        push: true
        pushTo: 'origin'
    clean:
      js: [
        "#{BUILD}/js/**"
        "#{PUBLIC}/js/**"
      ]
      css: [
        "#{BUILD}/css/**"
        "#{PUBLIC}/css/**"
      ]
      img: [
        "#{PUBLIC}/img/**"
      ]
      fonts: [
        "#{PUBLIC}/fonts"
      ]
    coffee:
      compile:
        options:
          bare: true
        files: [{
          expand: true
          cwd: 'coffee/'
          src: [
            '**/*.coffee'
          ]
          dest: "#{BUILD}/js/"
          ext: '.js'
        }]
    concat:
      options:
        separator: '\n'
        # stripBanners: true
        process: process
      css:
        src: [
          "#{BUILD}/css/typography.min.css"
          "#{BUILD}/css/**/*.min.css"
          "#{BUILD}/css/youtoo_tools.min.css"
        ]
        dest: 'lib/css/youtoo_tools.min.css'
      js:
        src: [
          "#{BUILD}/js/vendor/jquery.min.js"
          "#{BUILD}/js/vendor/**/*.min.js"
          "#{BUILD}/js/**/*.min.js"
          "#{BUILD}/js/popup.min.js"
          "#{BUILD}/js/main.min.js"
        ]
        dest: "#{JS}/youtoo_tools.min.js"
    copy:
      options:
        processContent: process
      js:
        expand: true
        flatten: true
        filter: 'isFile'
        src: [
          "#{BOWER}/jquery/dist/jquery.min.js"
          "#{BOWER}/async/lib/async.js"
        ]
        dest: 'build/js/vendor'
      css:
        expand: true
        flatten: true
        filter: 'isFile'
        src: [
          #
        ]
        dest: 'build/css'
      fonts:
        expand: true
        flatten: true
        filter: 'isFile'
        src: [
          #
        ]
        dest: 'lib/fonts/'
    cssmin:
      options:
        report: 'min'
      app:
        expand: true
        flatten: true
        filter: 'isFile'
        cwd: 'build/css'
        src: [
          "*.css"
          "*.*.css"
          "!*.min.css"
        ]
        dest: 'build/css'
        ext: '.min.css'
    image_resize:
      '128':
        options:
          width: 128
          height: 128
        files:
          'lib/img/youtoo_logo_128.png': 'img/Youtoo_Logo.png'
      '48':
        options:
          width: 48
          height: 48
        files:
          'lib/img/youtoo_logo_48.png': 'img/Youtoo_Logo.png'
      '38':
        options:
          width: 38
          height: 38
        files:
          'lib/img/youtoo_logo_38.png': 'img/Youtoo_Logo.png'
      '19':
        options:
          width: 19
          height: 19
        files:
          'lib/img/youtoo_logo_19.png': 'img/Youtoo_Logo.png'
      '16':
        options:
          width: 16
          height: 16
        files:
          'lib/img/youtoo_logo_16.png': 'img/Youtoo_Logo.png'
    jade:
      compile:
        options:
          pretty: true
          data:
            debug: false
        files: [{
          expand: true
          cwd: 'views/'
          src: '**/*.jade'
          dest: 'lib/'
          ext: '.html'
        }]
    less:
      compile:
        options:
          paths: [
            "less"
          ]
          compress: false
          cleancss: false
        files: [{
          expand: true
          cwd: 'less/'
          src: '**/*.less'
          dest: 'build/css/'
          ext: '.css'
          # "build/css/youtoo_tools.css": ["less/**/*.less"]
        }]
    lesslint:
      src: ['less/**/*.less']
    uglify:
      options:
        mangle: true
        compress: true
        preserveComments: false
      vendor:
        files: [{
          expand: true
          flatten: true
          cwd: "#{BUILD}/js/vendor"
          src: [
            "**/*.js"
            "!**/*.min.js"
          ]
          dest: "#{BUILD}/js/vendor"
          ext: '.min.js'
        }]
      lib:
        files: [{
          expand: true
          flatten: true
          cwd: "#{BUILD}/js"
          src: [
            "**/*.js"
            "!vendor/**/*.js"
          ]
          dest: "#{BUILD}/js/"
          ext: '.min.js'
        }]
    watch:
      options:
        debounceDelay: 250
      css:
        files: [
          'less/**/*.less'
        ]
        tasks: ['css']
      js:
        files: [
          'coffee/**/*.coffee'
        ]
        tasks: ['js']
      views:
        files: [
          'views/**/*.jade'
        ]
        tasks: ['jade']

  grunt.loadNpmTasks 'grunt-banner'
  grunt.loadNpmTasks 'grunt-bump'
  grunt.loadNpmTasks 'grunt-contrib-clean'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-copy'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-jade'
  grunt.loadNpmTasks 'grunt-contrib-less'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-devtools'
  grunt.loadNpmTasks 'grunt-image-resize'
  grunt.loadNpmTasks 'grunt-lesslint'

  ###
    Release tasks
  ###
  grunt.registerTask 'major', ['app', 'bump:major']
  grunt.registerTask 'release', ['app', 'bump:minor']
  grunt.registerTask 'patch', ['app', 'bump:patch']

  ###
    Actual code/build tasks
  ###
  grunt.registerTask 'css', ['clean:css', 'less', 'copy:css', 'cssmin', 'concat:css']
  grunt.registerTask 'js', ['clean:js', 'coffee', 'copy:js', 'uglify', 'concat:js']
  grunt.registerTask 'assets', ['clean:img', 'clean:fonts', 'copy:fonts', 'image_resize']

  ###
    Development tasks
  ###
  grunt.registerTask 'build', ['clean', 'css', 'js', 'assets', 'jade']
  grunt.registerTask 'default', ['clean', 'build', 'watch']