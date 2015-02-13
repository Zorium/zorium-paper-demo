z = require 'zorium'
paperColors = require 'zorium-paper/colors.json'
FloatingActionButton = require 'zorium-paper/floating_action_button'

styles = require './index.styl'

module.exports = class FloatingActionButtonDemo
  constructor: ->
    styles.use()

    @state = z.state
      $normal: new FloatingActionButton()
      $small: new FloatingActionButton()

  render: =>
    {$normal, $small} = @state()
    z '.z-floating-action-button-demo',
      z $normal,
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
      z $small,
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
