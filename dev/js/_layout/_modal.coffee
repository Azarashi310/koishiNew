class Modal
	constructor:(modal) ->
		@modal = modal
		@modalBG = @modal.find('.modalBG')
		@mainHeight
		@listsHeight
		@lists = $('.modal .lists')
		@list = $('#copylightworks .lists .list')
		@closebutton = @modal.find('.closebutton')
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
	showModal:() ->
		$(@modal).css({'opacity':1,'z-index':2})
	closebuttonClick:(e) ->
		_this = e.data
		_this.modal.css({'opacity':0,'z-index':-1})
	setmargin:() ->
		@mainHeight = window.innerHeight
		@lists.css('margin',((@mainHeight - @listsHeight)/2)+'px auto')
module.exports = Modal