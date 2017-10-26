Slick = require('./_layout/slick')
Modal = require('./_layout/modal')
TwitterLayout = require('../../js/_layout/_twitterLayout')

$ ->
  characterSlick = new Slick($('#character .modal .slick'), $('#character .slick-dots'))
  characterSlick.init();
  $(window).load(->
    twitterLayout = new TwitterLayout()
    twitterLayout.init(true)
    characterModal = new Modal($('#character'),$('#main'))
    characterModal.init()
    fanArtModal = new Modal($('#fanart'),$('#main'))
    fanArtModal.init()
  )