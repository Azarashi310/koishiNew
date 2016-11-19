class BackGroundAnimetion
	constructor: () ->
		@bg = $('body')
		@bgposx = 50
		@bgposy = 0
	init:() ->
		_this = @
#		setInterval(()->
#			_this.animetion()
#		,100)
	animetion:()->
		@bgposx -= 0.1
		@bgposy -= 0.1
		@bg.css('background-position-x',@bgposx+'%')
		@bg.css('background-position-y',@bgposy+'%')
module.exports = BackGroundAnimetion