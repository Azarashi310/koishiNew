class Slick
	constructor: (slider) ->
		@slider = slider
	init: () ->
		@slider.slick({
			cssEase:'ease',
			speed:500,
			draggable:false
		})
module.exports = Slick