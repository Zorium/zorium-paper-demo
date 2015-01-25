z = require 'zorium'

styles = require './index.styl'
styleVars = require '../../vars.json'

module.exports = class FontDemo
  constructor: ({
    text, isRaised, isDisabled, isTextLight,
    isDark, color200, color500, color600, color700
    }) ->

    styles.use()

    isRaised ?= false
    isDisabled ?= false
    isDark ?= false
    isTextLight ?= false
    color200 ?= styleVars.$grey800

    @state = z.state {
      text
      isRaised
      isDisabled
      isTextLight
      isDark
      color200
      color500
      color600
      color700
    }

  render: ({
    text, isRaised, isTextLight, isDisabled,
    isDark, color200, color500, color600, color700
    }) ->
    z '.z-button',
      z ".button#{isTextLight and '.light-text' or ''}
        .#{isRaised and 'raised' or 'flat'}#{isDark and '-dark' or ''}
        #{isDisabled and '[disabled]' or ''}",
        {
          # coffeelint: disable=missing_fat_arrows
          onmouseover: ->
            @style.backgroundColor = color600
          onmouseout: ->
            @style.backgroundColor = color500
          onmousedown: (e) ->
            @style.backgroundColor = color700

            $rippleEffect = document.createElement 'div'
            $rippleEffect.className = 'ripple-effect'
            $rippleEffect.style.backgroundColor = color200

            {height, top, left} = @getBoundingClientRect()

            x = e.clientX - left
            y = e.clientY - top

            startWidth = 10
            startHeight = 10

            $rippleEffect.style.height = startHeight
            $rippleEffect.style.width = startWidth

            $rippleEffect.style.top = y - height / 2 + startHeight + 'px'
            $rippleEffect.style.left = x - startWidth / 2 + 'px'

            @appendChild $rippleEffect

            window.setTimeout ->
              $rippleEffect.parentElement.removeChild $rippleEffect
            , 1400
          onmouseup: ->
            @style.backgroundColor = color600
          # coffeelint: enable=missing_fat_arrows

          style:
            backgroundColor: if isDisabled then null else color500
        },
        text
