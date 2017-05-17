Modal = require('./_modal')

class Slick
	constructor: (slider,dots) ->
		@slider = slider
		@dots = dots
		@dot = $(@dots[0]).find('.list')
		@$sliderDots = $('.character__thumb .list')
		@characterSliderCurrent = 0
		@sliderArrowPrev
		@sliderArrowNext
		@modal
		@modalFlag = false
		@slider.on 'afterChange' , @ , @movedSlider
		@allowSliderButtonClick = true
	init: (modalFlag) ->
		easekind = ''
		sliderSpeed = 0
		centerPd = ''
		accessibilityFlag = true
		if modalFlag
			easekind = 'none'
			sliderSpeed = 0
			centerPd = '60px'
			accessibilityFlag = true
		else
			easekind = 'ease'
			sliderSpeed = 500
			centerPd = '50px'
			accessibilityFlag = false
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
		@sliderArrowPrev = $('#character .slick-prev')
		@sliderArrowNext = $('#character .slick-next')
		@sliderArrowPrev.on 'click',this,@arrowClick
		@sliderArrowNext.on 'click',this,@arrowClick
	#連打対策
	movedSlider: (e) ->
		_this = e.data
		_this.allowSliderButtonClick = true
		console.log 'enableSlide'
	dotclick: (e) ->
		_this = e.data
		if _this.allowSliderButtonClick == false
			return false
		index = _this.dot.index(@)
		_this.characterSliderCurrent = index
		console.log _this.characterSliderCurrent
		_this.resetActive()
		$(_this.dot[index]).addClass('active')
		_this.slider.slick 'slickGoTo',parseInt(index)
		if _this.modalFlag
			_this.modal.showModal()
	arrowClick: (e) ->
		_this = e.data
		console.log 'arrowClickEvent : ',_this.allowSliderButtonClick
		if _this.allowSliderButtonClick
			_this.allowSliderButtonClick = false;
			if $(@).hasClass('slick-prev')
				console.log 'prev'
				_this.changeDot(false)
			else
				console.log 'next'
				_this.changeDot(true)
		else
			return false
	# prevOrNext false なら prev true なら next
	changeDot:(prevOrNext) ->
		@resetActive()
		console.log @characterSliderCurrent
		if prevOrNext
			if @characterSliderCurrent == @$sliderDots.length - 1
				$(@$sliderDots[0]).addClass('active')
				@characterSliderCurrent = 0
			else
				$(@$sliderDots[@characterSliderCurrent + 1]).addClass('active')
				@characterSliderCurrent++
		else
			if @characterSliderCurrent == 0
				$(@$sliderDots[@$sliderDots.length - 1]).addClass('active')
				@characterSliderCurrent = @$sliderDots.length - 1
			else
				$(@$sliderDots[@characterSliderCurrent - 1]).addClass('active')
				@characterSliderCurrent--
	resetActive: () ->
		@$sliderDots.removeClass('active')
module.exports = Slick