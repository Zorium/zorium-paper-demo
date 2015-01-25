z = require 'zorium'

Ripple = require '../ripple'
styles = require './index.styl'
styleVars = require '../../vars.json'

module.exports = class RadioButtom extends Ripple
  constructor: ({color500, color200, isChecked, isDisabled, isDark}) ->
    super()
    styles.use()

    isChecked ?= false
    isDisabled ?= false
    isDark ?= false

    @state = z.state {
      color500
      color200
      isChecked
      isDisabled
      isDark
    }

  toggle: =>
    @state.set isChecked: not @state().isChecked
  # coffeelint: disable=cyclomatic_complexity
  render: ({color500, color200, isChecked, isDisabled, isDark}) =>
    ripple = @ripple

    z ".z-radio-button
        #{isDark and '.dark' or '.light'}
        #{isChecked and '[checked]' or ''}
        #{isDisabled and '[disabled]' or ''}",
      {
        onclick: if not isDisabled then @toggle
        # coffeelint: disable=missing_fat_arrows
        onmousedown: (e) ->
          ripple this, color200, e.clientX, e.clientY, true, true
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
  # coffeelint: enable=cyclomatic_complexity
