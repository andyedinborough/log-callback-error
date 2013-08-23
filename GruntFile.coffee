module.exports = (grunt) ->  
	grunt.initConfig
		pkg: grunt.file.readJSON 'package.json'

		source: 
			coffee: ['src/log-callback-error.coffee']

		coffee:
			core: files: '<%= pkg.name %>.js': '<%= source.coffee %>'

		uglify:
			core: files: '<%= pkg.name %>.min.js': '<%= pkg.name %>.js'

		watch:
			coffee:
				files: ['<%= source.coffee %>']
				tasks: ['default', 'notify:watch']

		notify: watch: options: message: 'Build Complete'

	grunt.loadNpmTasks 'grunt-contrib-coffee'
	grunt.loadNpmTasks 'grunt-contrib-uglify'
	grunt.loadNpmTasks 'grunt-contrib-watch'
	grunt.loadNpmTasks 'grunt-notify'

	grunt.registerTask 'default', ['coffee', 'uglify']
