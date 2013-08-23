module.exports = (grunt) ->  
	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'

		coffee:
			core: files: '<%= pkg.name %>.js': 'src/log-callback-error.coffee'

		uglify:
			core: files: '<%= pkg.name %>.min.js': '<%= pkg.name %>.js'

	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-uglify'

	grunt.registerTask 'default', ['coffee', 'uglify']
