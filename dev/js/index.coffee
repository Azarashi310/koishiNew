Slick = require('./_animetion/_slick')
BackGroundAnimetion = require('./_animetion/backgroundAnimetion')
$ ->
	slick = new Slick($('.slick'),$('.slick-dots'))
	slick.init()
	bgAnimetion = new BackGroundAnimetion()
	bgAnimetion.init()