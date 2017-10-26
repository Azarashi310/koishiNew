Slick = require('./_layout/slick')
Modal = require('./_layout/modal')
TwitterLayout = require('../../js/_layout/_twitterLayout')

$ ->
  characterSlick = new Slick($('#character .character__lists'), $('#character .modal .slidShow'))
  characterSlick.init();
  $(window).load(->
    twitterLayout = new TwitterLayout()
    twitterLayout.init(true)
    modalLib = new Modal($('#character'),$('#main'))
    modalLib.init()
  )