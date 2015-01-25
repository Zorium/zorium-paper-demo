z = require 'zorium'

Ripple = require '../ripple'
styles = require './index.styl'
styleVars = require '../../vars.json'

module.exports = class Button extends Ripple
  constructor: ({
    text, isRaised, isDisabled, isTextLight,
    isDark, color200, color500, color600, color700
    }) ->
    super()

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
    }) =>
    ripple = @ripple

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
            ripple this, color200, e.clientX, e.clientY

          onmouseup: ->
            @style.backgroundColor = color600
          # coffeelint: enable=missing_fat_arrows

          style:
            backgroundColor: if isDisabled then null else color500
        },
        text
