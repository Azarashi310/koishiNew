Slick = require('./_layout/_slick')
Modal = require('./_layout/_modal')
BackGroundAnimetion = require('./_animetion/backgroundAnimetion')
$ ->
	characterSlick = new Slick($('.character__detail .slick'),$('.slick-dots'))
	characterSlick.init();
	modalSlick = new Slick($('#copylightworks .slick'),$('#copylightworks .slick-dots'))
	modalSlick.init();
	bgAnimetion = new BackGroundAnimetion()
	bgAnimetion.init()
	modal = new Modal($('.modal'))
	modal.init()
