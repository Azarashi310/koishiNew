TwitterLayout = require('../../js/_layout/_twitterLayout')

$ ->
  $(window).load(->
    twitterLayout = new TwitterLayout()
    twitterLayout.init('sp')
  )