class BackGroundAnimetion
	constructor: () ->
		@bg = $('body')
		@bgposx =-1257
		@bgposy = 4240
		@timeline
		@masterTimeline
	init:() ->
		TweenMax.ticker.fps(15)
		TweenMax.to @bg,120,{
			backgroundPosition:@bgposx+'px '+@bgposy+'px',
			repeat:-1,
			ease:Linear.easeNone
		}

module.exports = BackGroundAnimetion