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
		_this.resetActive()
		$(_this.dot[index]).addClass('active')
		_this.slider.slick 'slickGoTo',parseInt(index)
	resetActive: () ->
		i = 0
		while i < @dot.length
			if $(@dot[i]).hasClass('active')
				$(@dot[i]).removeClass('active')
			i++
module.exports = Slick