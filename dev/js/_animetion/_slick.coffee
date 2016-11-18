class Slick
	constructor: (slider,dots) ->
		@slider = slider
		@dots = dots
		@dot = @dots.find('.list')
	init: () ->
		@slider.slick({
			cssEase:'ease',
			speed:500,
			draggable:false,
			dots:false
		})
		@dot.on 'click',this,@dotclick
	dotclick: (e) ->
		_this = e.data;
		index = _this.dot.index(@)
		_this.slider.slick 'slickGoTo',parseInt(index)
module.exports = Slick