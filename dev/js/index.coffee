Slick = require('./_layout/_slick')
TwitterLayout = require('./_layout/_twitterLayout')
BackGroundAnimetion = require('./_animetion/backgroundAnimetion')
StampAnimetion = require('./_animetion/stampAnimetion')
MVPropaganda = require('./_animetion/mvPropaganda')
$ ->
	characterSlick = new Slick($('.character__detail .slick'),$('#character .slick-dots'))
	characterSlick.init(false);
	modalSlick = new Slick($('#copylightworks .slick'),$('#copylightworks .slick-dots'))
	modalSlick.init(true);
#	bgAnimetion = new BackGroundAnimetion()
#	bgAnimetion.init()
	stampAnimetion = new StampAnimetion()
	stampAnimetion.init()
	mvPropaganda = new MVPropaganda($('#mv .mv__propaganda'))
	$(window).load(->
		twitterLayout = new TwitterLayout()
		twitterLayout.init(false)
		mvPropaganda.init()
	)
