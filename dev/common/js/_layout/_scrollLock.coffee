class ScrollLock
    constructor:($target) ->
        @$target = $target
        @currentScrollPoint = 0
    enableScrollLock:() ->
        console.log('scrollLock',@$target)
        @currentScrollPoint = $(window).scrollTop()
        @$target.css({
            position:'fixed',
            width:'100%',
            top:-1*@currentScrollPoint
        })
    disabledScrollLock:() ->
        @$target.attr({style:''})
        $('html,body').prop({
            scrollTop:@currentScrollPoint
        })

module.exports = ScrollLock