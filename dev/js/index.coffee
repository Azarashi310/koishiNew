Slick = require('./_layout/_slick')
TwitterLayout = require('./_layout/_twitterLayout')
BackGroundAnimetion = require('./_animetion/backgroundAnimetion')
StampAnimetion = require('./_animetion/stampAnimetion')
$ ->
	characterSlick = new Slick($('.character__detail .slick'),$('#character .slick-dots'))
	characterSlick.init(false);
#	modalSlick = new Slick($('#copylightworks .slick'),$('#copylightworks .slick-dots'))
#	modalSlick.init(true);
#	bgAnimetion = new BackGroundAnimetion()
#	bgAnimetion.init()
	stampAnimetion = new StampAnimetion()
	stampAnimetion.init()
	$(window).load(->
		twitterLayout = new TwitterLayout()
		twitterLayout.init()
	)