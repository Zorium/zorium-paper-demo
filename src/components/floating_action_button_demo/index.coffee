z = require 'zorium'
paperColors = require 'zorium/colors.json'

FloatingActionButton = require '../floating_action_button'
styles = require './index.styl'

module.exports = class FloatingActionButtonDemo
  constructor: ->
    styles.use()

    @state = z.state
      buttons: [
        new FloatingActionButton
          colors:
            c500: paperColors.$red500
          $icon: z '.div',
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
          colors:
            c500: paperColors.$blue500
          $icon: z '.div',
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
