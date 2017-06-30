class Modal
	constructor:(modal,fixElement) ->
		@modal = modal
		@modalBG = @modal.find('.modalBG')
		@contents = fixElement
		@mainHeight
		@listsHeight
		@lists = $('.modal .lists')
		@list = $('#copylightworks .lists .list')
		@closebutton = @modal.find('.closebutton')
		@currentScrollPoint = 0
	init:() ->
		@mainHeight = window.innerHeight
		@listsHeight = @lists.innerHeight()
		@setmargin()
		$(window).resize this,@resizeEvent
		@closebutton.on 'click',this,@closebuttonClick
		@modalBG.on 'click',this,@closebuttonClick
		@list.on 'click',this,@showModal
	resizeEvent:(e) ->
		_this = e.data
		_this.setmargin()
		return
	showModal:() ->
		@currentScrollPoint = $(window).scrollTop()
		$(@contents).css({
			position:'fixed',
			width:'100%',
			top:-1*@currentScrollPoint
		})
		$(@modal).css({'opacity':1,'z-index':2})
		return
	closebuttonClick:(e) ->
		_this = e.data
		_this.contents.attr({style:''})
		$('html,body').prop({
			scrollTop:_this.currentScrollPoint
		})
		_this.modal.css({'opacity':0,'z-index':-1})
		return
	setmargin:() ->
		@mainHeight = window.innerHeight
		@lists.css('margin',((@mainHeight - @listsHeight)/2)+'px auto')
		return

module.exports = Modal