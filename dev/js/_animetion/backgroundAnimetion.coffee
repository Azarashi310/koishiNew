class BackGroundAnimetion
	constructor: () ->
		@bg = $('body')
		@bgposx =-1257
		@bgposy = 4240
		@timeline
		@masterTimeline
		@keyState = []
	init:() ->
		TweenMax.ticker.fps(15)
		@setAnimetion(120)
		$(window).keydown @,@keyDownEvent
		$(window).keyup @,@keyUpEvent
	keyDownEvent:(e) ->
		_this = e.data
		_this.keyState[e.keyCode] = true
		if _this.keyState[82] && _this.keyState[76]
			console.log 'ready'
			if _this.keyState[37]
				_this.bgposx = -1257
				_this.bgposy = 0
				_this.setAnimetion(60)
				console.log 'left'
			else if _this.keyState[38]
				_this.bgposx = 0
				_this.bgposy = -4240
				_this.setAnimetion(120)
				console.log 'up'
			else if _this.keyState[39]
				_this.bgposx = 1257
				_this.bgposy = 0
				_this.setAnimetion(60)
				console.log 'right'
			else if _this.keyState[40]
				_this.bgposx = 0
				_this.bgposy = 4240
				_this.setAnimetion(120)
				console.log 'right'
		return false
	setAnimetion:(time)->
		TweenMax.ticker.fps(15)
		TweenMax.to @bg,time,{
			backgroundPosition:@bgposx+'px '+@bgposy+'px',
			repeat:-1,
			ease:Linear.easeNone
		}
	keyUpEvent:(e) ->
		_this = e.data
		_this.keyState[e.keyCode] = false
		return false


module.exports = BackGroundAnimetion