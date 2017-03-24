Slick = require('./_layout/_slick')
TwitterLayout = require('./_layout/_twitterLayout')
BackGroundAnimetion = require('./_animetion/backgroundAnimetion')
StampAnimetion = require('./_animetion/stampAnimetion')
$ ->
	characterSlick = new Slick($('.character__detail .slick'),$('.slick-dots'))
	characterSlick.init(false);
	modalSlick = new Slick($('#copylightworks .slick'),$('#copylightworks .slick-dots'))
	modalSlick.init(true);
	bgAnimetion = new BackGroundAnimetion()
	bgAnimetion.init()
	stampAnimetion = new StampAnimetion()
	stampAnimetion.init()
	$(window).load(->
		console.log 'windowLoad'
		twitterLayout = new TwitterLayout()
		twitterLayout.init()
	)