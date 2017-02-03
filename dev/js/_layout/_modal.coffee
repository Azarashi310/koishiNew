class Modal
	constructor:(modal) ->
		@modal = modal
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
		@list.on 'click',this,@showModal
	resizeEvent:(e) ->
		_this = e.data
		_this.setmargin()
	showModal:(e) ->
		_this = e.data
		_this.modal.css('display','block')
	closebuttonClick:(e) ->
		_this = e.data
		_this.modal.css('display','none')
	setmargin:() ->
		@mainHeight = window.innerHeight
		@lists.css('margin',((@mainHeight - @listsHeight)/2)+'px auto')
module.exports = Modal