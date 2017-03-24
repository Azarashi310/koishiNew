class StampAnimetion
	constructor:->
		@$stamp = $('.stampList .stamp')
		@stampAnimetionTimeline = new TimelineMax({
			paused:true
		})
	init:->
		@animetion()
	animetion: ->
		$.each @$stamp,(index)->
			TweenMax.to(
				$(@),
				2.0,
				{
					top:parseInt($(@).css('top')) + 10,
					repeat:-1,
					delay:(Math.floor((Math.random() * 10)))/10,
					yoyo:true,
					ease:' Power0.easeNone'
				}
			)
module.exports = StampAnimetion
