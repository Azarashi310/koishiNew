Modal = require('./_modal')

class Slick
	constructor: (slider,dots) ->
		@slider = slider
		@dots = dots
		@dot = $(@dots[0]).find('.list')
		@$sliderDots = $('.character__thumb .list')
		@characterSliderCurrent = 0
#		@sliderArrowPrev = $(@slider).find('.slick-prev')
		@sliderArrowPrev = $('.character__detail .slick .slick-prev')
		@sliderArrowNext = $('.character__detail .slick .slick-next')
		@modal
		@modalFlag = false
	init: (modalFlag) ->
		console.log @sliderArrowPrev
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
		if $(@).hasClass('slick-prev')
			console.log 'prev'
			_this.changeDot(false)
		else
			console.log 'next'
			_this.changeDot(true)
	# prevOrNext false なら prev true なら next
	changeDot:(prevOrNext) ->
		console.log @characterSliderCurrent
		@$sliderDots.removeClass('active')
		if prevOrNext
			if @characterSliderCurrent == @$sliderDots.length - 1
				@$sliderDots[0].addClass('current')
				@characterSliderCurrent = 0
			else
				@$sliderDots[@characterSliderCurrent + 1].addClass('current')
				@characterSliderCurrent++
		else
			if @characterSliderCurrent == 0
				@$sliderDots[@$sliderDots.length - 1].addClass('current')
				@characterSliderCurrent = @$sliderDots.length - 1
			else
				@$sliderDots[@characterSliderCurrent - 1].addClass('current')
				@characterSliderCurrent--
	resetActive: () ->
		i = 0
		while i < @dot.length
			if $(@dot[i]).hasClass('active')
				$(@dot[i]).removeClass('active')
			i++
module.exports = Slick