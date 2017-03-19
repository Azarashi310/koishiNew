Modal = require('./_modal')

class Slick
	constructor: (slider,dots) ->
		@slider = slider
		@dots = dots
		@dot = $(@dots[0]).find('.list')
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
			_this.changeDot(false)
		else
			_this.changeDot(true)
	# prevOrNext false なら prev true なら next
	changeDot:(prevOrNext) ->
		i = 0
		while i < @dot.length
			console.log @dot[i]
			if $(@dot[i]).hasClass('active')
				console.log 'act'
				if prevOrNext
					if i == @dot.length - 1
						$(@dot[0]).addClass('active')
					else
						$(@dot[i + 1]).addClass('active')
					$(@dot[i]).removeClass('active')
				else
					if i == 0
						$(@dot[@dot.length - 1]).addClass('active')
					else
						$(@dot[i - 1]).addClass('active')
					$(@dot[i]).removeClass('active')
			i++
	resetActive: () ->
		i = 0
		while i < @dot.length
			if $(@dot[i]).hasClass('active')
				$(@dot[i]).removeClass('active')
			i++
module.exports = Slick