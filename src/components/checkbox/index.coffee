z = require 'zorium'

Ripple = require '../ripple'
styles = require './index.styl'
styleVars = require '../../vars.json'

module.exports = class RadioButtom extends Ripple
  constructor: ({color500, isChecked, isDisabled, isDark}) ->
    super()
    styles.use()

    isChecked ?= false
    isDisabled ?= false
    isDark ?= false

    @state = z.state {
      color500
      isChecked
      isDisabled
      isDark
    }

  toggle: =>
    @state.set isChecked: not @state().isChecked

  checkboxClass: =>
    {isDark, isChecked, isDisabled} = @state()

    _.filter([
      '.z-checkbox'
      isDark and '.dark' or '.light'
      isChecked and '[checked]'
      isDisabled and '[disabled]'
    ]).join('')

  render: ({color500, isChecked, isDisabled, isDark}) =>
    z @checkboxClass(),
      {
        onmousedown: z.ev (e, $$el) =>
          unless isDisabled
            if isChecked
              if isDark
                @ripple $$el, styleVars.$grey200,
                  e.clientX, e.clientY, true, true
              else
                @ripple $$el, styleVars.$grey800,
                  e.clientX, e.clientY, true, true
            else
              @ripple $$el, color500, e.clientX, e.clientY, true, true

            @toggle()
      },
      z '.checkbox', {
        style:
          backgroundColor: if isChecked and not isDisabled then color500 \
                           else null
          borderColor: if isChecked and not isDisabled then color500 \
                           else null
      }
      z '.checkmark'
