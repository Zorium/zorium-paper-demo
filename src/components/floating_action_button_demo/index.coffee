z = require 'zorium'

FloatingActionButton = require '../floating_action_button'
styles = require './index.styl'
styleVars = require 'zorium/colors.json'

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
              margin: '2px'
              background: 'black'
              color: 'white'
              textAlign: 'center'
              lineHeight: '20px'
            , 'Z'
        new FloatingActionButton
          isMini: true
          color500: styleVars.$blue500
          icon: z '.div',
            style:
              width: '20px'
              height: '20px'
              margin: '2px'
              background: 'black'
              color: 'white'
              textAlign: 'center'
              lineHeight: '20px'
            , 'Z'
      ]

  render: ({buttons}) ->
    z '.z-floating-action-button-demo',
      buttons
