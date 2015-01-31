z = require 'zorium'

Ripple = require '../ripple'
styles = require './index.styl'
styleVars = require 'zorium/colors.json'

module.exports = class Button
  constructor: ({
    text, isRaised, isDisabled, isTextLight, onclick,
    isDark, isShort, inkColor, color200, color500, color600, color700
    }) ->
    styles.use()

    isRaised ?= false
    isFlat = not isRaised
    isDisabled ?= false
    isDark ?= false
    isTextLight ?= false
    onclick ?= (-> null)
    color200 ?= styleVars.$grey800

    @state = z.state {
      text
      listeners:
        onclick: onclick
      isRaised
      isFlat
      isDisabled
      isTextLight
      isDark
      isShort
      inkColor
      color200
      color500
      color600
      color700
      $ripple: new Ripple()
    }

  render: ({
    text, isDisabled, listeners, inkColor,
    color200, color500, color600, color700, $ripple,
    isTextLight, isRaised, isShort, isDark, isFlat
    }) ->

    z '.z-button',
      className: z.classKebab {
        isTextLight
        isRaised
        isFlat
        isShort
        isDark
      }
      z '.button',
        {
          attributes:
            if isDisabled
              disabled: true
          onclick: listeners.onclick
          onmouseover: z.ev (e, $$el) ->
            $$el.style.backgroundColor = color600

          onmouseout: z.ev (e, $$el) ->
            $$el.style.backgroundColor = color500

          onmousedown: z.ev (e, $$el) ->
            $$el.style.backgroundColor = color700
            $ripple.ripple $$el, inkColor or color200, e.clientX, e.clientY

          onmouseup: z.ev (e, $$el) ->
            $$el.style.backgroundColor = color600

          style:
            backgroundColor: if isDisabled then null else color500
            color: if inkColor and not isDisabled then inkColor else null
        },
        text
