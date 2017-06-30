ScrollLock = require('../../common/js/_layout/_scrollLock')

class MVPropaganda
    constructor: () ->
        @scrollLock
    init: () ->
        @scrollLock = new ScrollLock($('#main'))
        $('#mv .mv__propaganda').on('click', this, @modalToggle)
        @iconAnimation()
    iconAnimation:() ->
        _this = @
        timeLine = new TimelineMax({
            paused:true,
            onComplete: ->
                $('#mv .charaMask').on('mouseover', ->
                    TweenMax.fromTo(
                        $('#mv .chara'),0.2,{
                            top:'19px'
                        },{
                            top:'9px',
                            ease:Back.easeOut.config(1.8)
                        }
                    )
                    TweenMax.fromTo(
                        $('#mv .charaBg'),0.2,{
                            bottom:'-211px'
                        },{
                            bottom:'-201px',
                            ease:Back.easeOut.config(1.8)
                        }
                    )
                )
                $('#mv .mv__propaganda').on('mouseout', ->
                    TweenMax.fromTo(
                        $('#mv .chara'),0.2,{
                            top:'9px'
                        },{
                            top:'19px',
                            ease:Back.easeOut.config(1.8)
                        }
                    )
                    TweenMax.fromTo(
                        $('#mv .charaBg'),0.2,{
                            bottom:'-201px'
                        },{
                            bottom:'-211px',
                            ease:Back.easeOut.config(1.8)
                        }
                    )
                )
        })

        timeLine.addLabel('anim_circle',0)
        timeLine.addLabel('anim_baloon',0.8)
        timeLine.insertMultiple(
            [
                TweenMax.fromTo(
                    $('#mv .circle'),0.4,{
                        width:'0',
                        height:'0',
                        borderWidth:'0px',
                        opacity:'0'
                    },{
                        width:'162px',
                        height:'162px',
                        borderWidth:'4px',
                        opacity:'1',
                        ease:Power2.easeOut
                    }
                )
                TweenMax.fromTo(
                    $('#mv .chara'),0.4,{
                        top:'100px',
                        left:'100px',
                        opacity:'0'
                    },{
                        left:'20px',
                        top:'19px',
                        opacity:'1',
                        delay:0.4,
                        ease:Back.easeOut.config(1.8)
                    }
                )
                TweenMax.fromTo(
                    $('#mv .charaBg'),0.4,{
                        opacity:'0'
                    },{
                        opacity:'1',
                        delay:0.4,
                        ease:Power2.easeOut
                    }
                )
            ]
            'anim_circle'
        )
        timeLine.insertMultiple(
            [
                TweenMax.fromTo(
                    $('#mv .baloon'),0.4,{
                        opacity:0,
                        top:'20px'
                    },{
                        opacity:1,
                        top:'0px',
                        ease:Power2.easeOut
                    }
                )
            ]
            'anim_baloon'
        )
        timeLine.play()
    modalToggle:(e) ->
        _this = e.data
        console.log('MVIconClick')
        if $('#mv .mv__modal').hasClass('show')
            $('#mv .mv__modal').toggleClass('show');
            TweenMax.to($('#mv .mv__modal'),0.2,{
                opacity:'0'
            })
            _this.scrollLock.disabledScrollLock()
        else
            $('#mv .mv__modal').toggleClass('show');
            TweenMax.to($('#mv .mv__modal'),0.2,{
                opacity:'1'
            })
            _this.scrollLock.enableScrollLock()

module.exports = MVPropaganda