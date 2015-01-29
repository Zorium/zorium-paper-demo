z = require 'zorium'

styles = require './index.styl'
styleVars = require '../../vars.json'

module.exports = class Ripple
  constructor: ->
    styles.use()

  ripple: ($$el, color, mouseX, mouseY, isCenter = false, isSmall = false) ->
    $$rippleEffect = document.createElement 'div'
    $$rippleEffect.className = "z-ripple #{isSmall and 'small' or ''}"
    $$rippleEffect.style.backgroundColor = color

    {width, height, top, left} = $$el.getBoundingClientRect()

    x = mouseX - left
    y = mouseY - top

    startWidth = 10
    startHeight = 10

    if isCenter
      $$rippleEffect.style.top = height / 2 + 'px'
      $$rippleEffect.style.left = width / 2 + 'px'
    else
      $$rippleEffect.style.top = y - height / 2 + startHeight * 2 + 'px'
      $$rippleEffect.style.left = x + 'px'

    $$el.appendChild $$rippleEffect

    if isSmall
      window.setTimeout ->
        $$rippleEffect.parentElement.removeChild $$rippleEffect
      , 900
    else
      window.setTimeout ->
        $$rippleEffect.parentElement.removeChild $$rippleEffect
      , 1400
