class Slick
  constructor: (slider, dots)->
    @slider = slider
    @dots = dots

  init: () ->
    @slider.slick
      easekind : 'ease'
      dots : false
      variableWidth : true
      centerPadding : '10px'
      slidesToShow:1
module.exports = Slick