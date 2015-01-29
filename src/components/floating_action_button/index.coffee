z = require 'zorium'

Ripple = require '../ripple'
styles = require './index.styl'
styleVars = require '../../vars.json'

module.exports = class FloatingActionButton
  constructor: ({icon, color500, isMini, onclick}) ->
    styles.use()

    isMini ?= false

    @state = z.state {
      icon
      color500
      isMini
      $ripple: new Ripple()
      listeners:
        onclick: onclick
    }

  render: ({icon, color500, isMini, listeners, $ripple}) ->
    z ".z-floating-action-button#{isMini and '.mini' or ''}", {
      onclick: listeners.onclick
      onmousedown: z.ev (e, $$el) ->
        $ripple.ripple $$el, styleVars.$white70, e.clientX, e.clientY

      style:
        backgroundColor: color500
    },
    z '.icon-container',
      icon
