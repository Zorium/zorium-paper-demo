z = require 'zorium'

Ripple = require '../ripple'
styles = require './index.styl'
styleVars = require 'zorium/colors.json'

module.exports = class Button
  constructor: ({text, isRaised, isDisabled,
                 onclick, isDark, isShort, colors}) ->
    styles.use()

    isRaised ?= false
    isFlat = not isRaised
    isDisabled ?= false
    isDark ?= false
    onclick ?= (-> null)
    colors ?= {}

    colors = _.defaults colors, {
      cText: if colors.ink and not isDisabled \
                   then colors.ink
                   else null
      c200: styleVars.$grey800
      c500: null
      c600: null
      c700: null
      ink: null
    }

    @state = z.state {
      text
      listeners:
        onclick: onclick
      isRaised
      isFlat
      isDisabled
      isDark
      isShort
      colors
      backgroundColor: if isDisabled then null else colors.c500
      $ripple: new Ripple()
    }

  render: ({text, isDisabled, listeners, $ripple, isRaised,
            isShort, isDark, isFlat, backgroundColor, colors}) =>

    z '.z-button',
      className: z.classKebab {
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
          onmouseover: =>
            @state.set backgroundColor: colors.c600

          onmouseout: =>
            @state.set backgroundColor: colors.c500

          onmousedown: z.ev (e, $$el) =>
            @state.set backgroundColor: colors.c700
            $ripple.ripple $$el, colors.ink or colors.c200, e.clientX, e.clientY

          onmouseup: z.ev (e, $$el) =>
            @state.set backgroundColor: colors.c600

          style:
            backgroundColor: backgroundColor
            color: if isDisabled then null else colors.cText
        },
        text
