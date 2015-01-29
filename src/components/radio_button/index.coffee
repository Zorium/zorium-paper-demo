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

  radioButtonClass: =>
    {isDark, isChecked, isDisabled} = @state()

    _.filter([
      '.z-radio-button'
      isDark and '.dark' or '.light'
      isChecked and '[checked]'
      isDisabled and '[disabled]'
    ]).join('')

  render: ({color500, isChecked, isDisabled, isDark}) =>
    ripple = @ripple
    toggle = @toggle

    z @radioButtonClass(),
      {
        # coffeelint: disable=missing_fat_arrows
        onmousedown: (e) ->
          unless isDisabled
            if isChecked
              if isDark
                ripple this, styleVars.$grey200,
                  e.clientX, e.clientY, true, true
              else
                ripple this, styleVars.$grey800,
                  e.clientX, e.clientY, true, true
            else
              ripple this, color500, e.clientX, e.clientY, true, true
            toggle()
        # coffeelint: enable=missing_fat_arrows
      },
      z '.ring', {
        style:
          borderColor: if isChecked and not isDisabled then color500 else null
      }
      z '.fill', {
        style:
          backgroundColor: if not isDisabled then color500 else null
      }
