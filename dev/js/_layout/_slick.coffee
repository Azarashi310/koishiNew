Modal = require('./_modal')

class Slick
	constructor: (slider,dots) ->
		@slider = slider
		@dots = dots
		@dot = $(@dots[0]).find('.list')
		@sliderArrowPrev = $(@slider).find('.slick-prev')
		@sliderArrowNext = $(@slider).find('.slick-next')
		@modal
		@modalFlag = false
	init: (modalFlag) ->
		easekind = ''
		sliderSpeed = 0
		centerPd = ''
		if modalFlag
			easekind = 'none'
			sliderSpeed = 0
			centerPd = '60px'
		else
			easekind = 'ease'
			sliderSpeed = 500
			centerPd = '50px'
		@slider.slick({
			cssEase:easekind,
			speed:sliderSpeed,
			draggable:false,
			dots:false,
			variableWidth:true,
			centerMode:true,
			centerPadding:centerPd
			slidesToShow:1
		})
		if modalFlag
			@modalFlag = true
			@modal = new Modal($('.modal'),$('#main'))
			@modal.init()
		@dot.on 'click',this,@dotclick
		@sliderArrowPrev.on 'click',this,@arrowClick
		@sliderArrowNext.on 'click',this,@arrowClick
	dotclick: (e) ->
		_this = e.data
		index = _this.dot.index(@)
		_this.resetActive()
		$(_this.dot[index]).addClass('active')
		_this.slider.slick 'slickGoTo',parseInt(index)
		if _this.modalFlag
			_this.modal.showModal()
	arrowClick: (e) ->
		_this = e.data
		console.log 'aaa'
	resetActive: () ->
		i = 0
		while i < @dot.length
			if $(@dot[i]).hasClass('active')
				$(@dot[i]).removeClass('active')
			i++
module.exports = Slick