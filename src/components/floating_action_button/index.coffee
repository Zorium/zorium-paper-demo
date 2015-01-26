z = require 'zorium'

Ripple = require '../ripple'
styles = require './index.styl'
styleVars = require '../../vars.json'

module.exports = class FloatingActionButton extends Ripple
  constructor: ({icon, color500, isMini, onclick}) ->
    super()

    styles.use()

    isMini ?= false

    @state = z.state {
      icon
      color500
      isMini
      listeners:
        onclick: onclick
    }

  # coffeelint: disable=cyclomatic_complexity
  render: ({icon, color500, isMini, listeners}) ->
    ripple = @ripple

    z ".z-floating-action-button#{isMini and '.mini' or ''}", {
      onclick: listeners.onclick
      # coffeelint: disable=missing_fat_arrows
      onmousedown: (e) ->
        ripple this, styleVars.$white70, e.clientX, e.clientY
      # coffeelint: enable=missing_fat_arrows

      style:
        backgroundColor: color500
    },
    z '.icon-container',
      icon
  # coffeelint: enable=cyclomatic_complexity
