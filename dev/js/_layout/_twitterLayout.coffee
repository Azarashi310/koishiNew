class TwitterLayout
	constructor: ->
		@twFrame = $('iframe.twitter-timeline')

	init: ->
		if @twFrame.length > 0
			@twFrame.contents().find('head').append('<link href="http://freecreate.sub.jp/koishi/css/twitter.css" rel="stylesheet" type="text/css" media="all" />')
#			@twFrame.contents().find('head').append('<link href="/css/twitter.css" rel="stylesheet" type="text/css" media="all" />')
		else
			setTimeout @init,500

module.exports = TwitterLayout