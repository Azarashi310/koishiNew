class TwitterLayout
  constructor: ->
    @twFrame = $('iframe.twitter-timeline')

  init: (isSP)->
    console.log @twFrame
    if @twFrame.length == undefined
      setTimeout @init, 500
    else
      if isSP
      # 公開用
#        @twFrame.contents().find('head').append('<link href="http://freecreate.sub.jp/koishi/sp/css/twitter.css" rel="stylesheet" type="text/css" media="all" />')
      # TEST
        @twFrame.contents().find('head').append('<link href="http://freecreate.sub.jp/koishi/sp/css/twitter.css" rel="stylesheet" type="text/css" media="all" />')
      else
        @twFrame.contents().find('head').append('<link href="http://freecreate.sub.jp/koishi/css/twitter.css" rel="stylesheet" type="text/css" media="all" />')

module.exports = TwitterLayout