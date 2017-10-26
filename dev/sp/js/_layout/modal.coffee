# 要Jquery(当方1.12.4)
# 使い方
# modalElementにはmodalを包んでいる要素を渡してください。
# fixedElementにはmodalを表示させる際に、スクロールさせたくない
# 要素を渡してください。
#
# モーダルを表示させるボタンとして使いたい要素には
# modal__button__toggle のクラスをつけてください。
# openさせる要素とcloseさせる要素が別々な場合は
# modal__button__open　と modal__button__closeを
# それぞれの要素につけてください。
# ない場合はエラーを吐き〼。(実装予定)
#

class Modal
  constructor: (modalElement, fixedElement) ->
    @$modal = modalElement
    @$fixedTarget = fixedElement
    @currentScrollPoint = 0
    @switchingModalKind = ''
    #modalPartsVars
    if $(@$modal.find '.modal__button__toggle').length > 0
      console.log 'buttonToggle is exist'
      @modal__button__toggle = @$modal.find('.modal__button__toggle')
      @switchingModalKind = 'toggle';
    else if $(@$modal.find '.modal__button__open').length > 0 && $(@$modal.find '.modal__button__close').length > 0
      @$modal__button__open = @$modal.find '.modal__button__open'
      @$modal__button__close = @$modal.find '.modal__button__close'
      @switchingModalKind = 'button';
    else
#      @errorNotification()
  init: () ->
    @$modal__button__open.on 'click', @, @clickModalButton
    @$modal__button__close.on 'click', @, @clickModalButton
  clickModalButton: (e) ->
    _this = e.data
    console.log @
    _this.targetFixed($('html').hasClass('show'));
    if _this.switchingModalKind == 'toggle'
      $(@).toggleClass('show')
    else if _this.switchingModalKind == 'button'
      if $(@).hasClass 'modal__button__open'
        $('html').addClass('show')
      else if $(@).hasClass 'modal__button__close'
        $('html').removeClass('show')

  targetFixed: (isRelease)->
    @$modal.toggleClass('modalShow');
    if isRelease
      console.log @currentScrollPoint
      @$fixedTarget.attr
        style: ''
      $('html,body').prop
        scrollTop : @currentScrollPoint
    else
      @currentScrollPoint = $(window).scrollTop()
      console.log @currentScrollPoint
      @$fixedTarget.css
        position: 'fixed'
        width: '100%'
        top: -1 * @currentScrollPoint

#  errorNotification: ()->
#    console.log $(@$modal.find '.modal__button__open').length
#    if $(@$modal.find '.modal__button__toggle').length < 1
#      console.log 'Error! : modal__button__toggle is notExist'
#    if $(@$modal.find '.modal__button__open').length < 1
#      console.log 'Error! : modal__button__open is notExist'
#    if $(@$modal.find '.modal__button__close').length < 1
#      console.log 'Error! : modal__button__close is notExist'

module.exports = Modal