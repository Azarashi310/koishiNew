Slick = require('./_layout/_slick')

BackGroundAnimetion = require('./_animetion/backgroundAnimetion')
$ ->
	characterSlick = new Slick($('.character__detail .slick'),$('.slick-dots'))
	characterSlick.init(false);
	modalSlick = new Slick($('#copylightworks .slick'),$('#copylightworks .slick-dots'))
	modalSlick.init(true);
	bgAnimetion = new BackGroundAnimetion()
	bgAnimetion.init()
#	bgAnimetion.animetion()
#	modal = new Modal($('.modal'))
#	modal.init()
