class Slick
	constructor: (slider,dots) ->
		@slider = $(slider[0])
		@modalSlider = $(slider[1])
		@dots = dots
		@dot = $(@dots[0]).find('.list')
		@modalDot = $(@dots[1]).find('.list')
	init: () ->
		console.log $(@modalSlider)
		@slider.slick({
			cssEase:'ease',
			speed:500,
			draggable:false,
			dots:false,
			variableWidth:true,
			centerMode:true,
			slidesToShow:1
		})
		@modalSlider.slick({
			cssEase:'ease',
			speed:500,
			draggable:false,
			dots:false,
			variableWidth:true,
			centerMode:true,
			slidesToShow:1
		})
		@dot.on 'click',this,@dotclick
		@modalDot.on 'click',this,@dotclick
	dotclick: (e) ->
		_this = e.data;
		if $(@).parents('#copylightworks').length
			_this.modalSlider.slick 'slickGoTo',parseInt(index)
		else
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