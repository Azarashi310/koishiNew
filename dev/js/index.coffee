Slick = require('./_layout/_slick')
TwitterLayout = require('./_layout/_twitterLayout')
BackGroundAnimetion = require('./_animetion/backgroundAnimetion')
$ ->
	characterSlick = new Slick($('.character__detail .slick'),$('.slick-dots'))
	characterSlick.init(false);
	modalSlick = new Slick($('#copylightworks .slick'),$('#copylightworks .slick-dots'))
	modalSlick.init(true);
#	bgAnimetion = new BackGroundAnimetion()
#	bgAnimetion.init()
#	bgAnimetion.animetion()
	$(window).load(->
		console.log 'windowLoad'
		twitterLayout = new TwitterLayout()
		twitterLayout.init()
	)