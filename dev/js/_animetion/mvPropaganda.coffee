class MVPropaganda
    constructor: () ->
    init: () ->
        _this = @
        timeLine = new TimelineMax({
            paused:true
        })
        timeLine.addLabel('anim_circle',0)
        timeLine.insertMultiple(
            [
                TweenMax.from(
                    $('#mv .circle'),0.4,{
                        width:'0',
                        height:'0',
                        borderWidth:'0px',
                        ease:Back.easeOut.config(1.7)
                    }
                )
                TweenMax.from(
                    $('#mv .chara'),0.4,{
                        bottom:'-300',
                        delay:0.2
                    }
                )
            ]
            'anim_circle'
        )
        timeLine.play()

module.exports = MVPropaganda