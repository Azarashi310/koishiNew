Modal = require('./_modal')

class Slick
	constructor: (slider,dots) ->
		@slider = slider
		@charaSlider
		@modalSlider
		@dots = dots
		@charaDot
		@modalDot
		@dot = $(@dots[0]).find('.list')
		@$sliderDots = $('.character__thumb .list')
		@characterSliderCurrent = 0
		@sliderArrowPrev
		@sliderArrowNext
		@modal
		@modalFlag  = false
		@slider.on 'afterChange' , @ , @movedSlider
		@allowSliderButtonClick = true
	init: (modalFlag) ->
		@modalFlag = modalFlag
		easekind = ''
		sliderSpeed = 0
		centerPd = ''
		accessibilityFlag = true
		if modalFlag
			@modalSlider = @slider
			@modalDot = $(@dots[0]).find('.list')
			easekind = 'none'
			sliderSpeed = 0
			centerPd = '60px'
			accessibilityFlag = true
			@modalSlider.slick({
				cssEase:easekind,
				speed:sliderSpeed,
				draggable:false,
				dots:false,
				variableWidth:true,
				centerMode:true,
				centerPadding:centerPd
				slidesToShow:1
			})
			@modal = new Modal($('.modal'),$('#main'))
			@modalDot.on 'click',this,@dotclick
			@modal.init()
		else
			@charaSlider = @slider
			@charaDot = $(@dots[0]).find('.list')
			easekind = 'ease'
			sliderSpeed = 500
			centerPd = '50px'
			accessibilityFlag = false
			@charaSlider.slick({
				cssEase:easekind,
				speed:sliderSpeed,
				draggable:false,
				dots:false,
				variableWidth:true,
				centerMode:true,
				centerPadding:centerPd
				slidesToShow:1
			})
			@charaDot.on 'click',this,@dotclick
			@sliderArrowPrev = $('#character .slick-prev')
			@sliderArrowNext = $('#character .slick-next')
			@sliderArrowPrev.on 'click',this,@arrowClick
			@sliderArrowNext.on 'click',this,@arrowClick
	#連打対策
	movedSlider: (e) ->
		_this = e.data
		_this.allowSliderButtonClick = true
	dotclick: (e) ->
		_this = e.data
		if _this.modalFlag
			index = _this.modalDot.index(@)
			_this.characterSliderCurrent = index
			$(_this.modalDot[index]).addClass('active')
			_this.slider.slick 'slickGoTo',parseInt(index)
			_this.modal.showModal()
		else
			if _this.allowSliderButtonClick == false
				return false
			index = _this.charaDot.index(@)
			_this.characterSliderCurrent = index
			_this.resetActive()
			$(_this.charaDot[index]).addClass('active')
			_this.slider.slick 'slickGoTo',parseInt(index)

	arrowClick: (e) ->
		_this = e.data
		if _this.allowSliderButtonClick
			_this.allowSliderButtonClick = false;
			if $(@).hasClass('slick-prev')
				_this.changeDot(false)
			else
				_this.changeDot(true)
		else
			return false
	# prevOrNext false なら prev true なら next
	changeDot:(prevOrNext) ->
		@resetActive()
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
