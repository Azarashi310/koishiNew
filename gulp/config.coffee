#require for use webpack-plugin
webpack = require('webpack')
path = require('path')
fs = require('fs')

dest = './dist/'
src = './dev/'

module.exports =
	jade:
		src: [
			src + '**/*.jade',
			'!' + src + '**/template/**.jade'
		]
		dest: dest
		opt:
			pretty: true
	style:
		src: [
			src + '**/*.scss'
		]
		dest: dest
		autoprefixer_opt:
			browsers: ['last 100 versions']
		cmq_opt:
			log: false
	concat:
		lib:[

		]
		filename: 'lib.js'
		dest: dest + 'article/special/js/'
	webpack:
		src: src + '**/js/**'
		dest: dest
		entry:
			"article/special/sharefile/js/shared":src+"article/special/sharefile/js/shared"
		output:
			publicPath : dest
			filename : "[name].min.js"
		resolve:
			modulesDirectories: ['node_modules', 'bower_components']
			extensions: ['', '.js', '.coffee', '.html', '.ts']
#		devtool: "#inline-source-map"
		module:
			loaders: [
				{ test: /\.coffee$/, loader: 'coffee-loader' }
			]
		plugins: [
			new webpack.optimize.UglifyJsPlugin()
		]
	watch:
		pass:
			jade: src + '**/*.jade'
			jade_tmp: src + '**/template/template.jade'
			style: src + '**/*.scss'
			webpack: src + '**/js/**'