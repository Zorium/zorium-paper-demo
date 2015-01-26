z = require 'zorium'

FloatingActionButton = require '../floating_action_button'
styles = require './index.styl'
styleVars = require '../../vars.json'

module.exports = class ButtonDemo
  constructor: ->
    styles.use()

    @state = z.state
      buttons: [
        new FloatingActionButton
          color500: styleVars.$red500
          icon: z '.div',
            style:
              display: 'inline-block'
              width: '20px'
              height: '20px'
              padding: '2px'
              background: 'black'
        new FloatingActionButton
          isMini: true
          color500: styleVars.$blue500
          icon: z '.div',
            style:
              width: '20px'
              height: '20px'
              padding: '2px'
              background: 'black'
      ]

  render: ({buttons}) ->
    z '.z-floating-action-button-demo',
      buttons
