z = require 'zorium'

Ripple = require '../ripple'
styles = require './index.styl'
styleVars = require '../../vars.json'

module.exports = class Button
  constructor: ({
    text, isRaised, isDisabled, isTextLight, onclick,
    isDark, isShort, inkColor, color200, color500, color600, color700
    }) ->
    styles.use()

    isRaised ?= false
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

  buttonClass: =>
    {isTextLight, isRaised, isDisabled, isShort, isDark} = @state()

    _.filter([
      '.button'
      isTextLight and '.light-text'
      isRaised and '.raised' or '.flat'
      isDark and '.dark'
      isDisabled and '[disabled]'
      isShort and '.short'
    ]).join('')

  render: ({
    text, isDisabled, listeners, inkColor,
    color200, color500, color600, color700, $ripple
    }) =>

    z '.z-button',
      z @buttonClass(),
        {
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
