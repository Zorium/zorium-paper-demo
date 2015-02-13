z = require 'zorium'
paperColors = require 'zorium-paper/colors.json'
RadioButton = require 'zorium-paper/radio_button'

styles = require './index.styl'

module.exports = class RadioButtonDemo
  constructor: ->
    styles.use()

    @state = z.state
      $unchecked: _.map _.range(100), -> new RadioButton()
      $checked: _.map _.range(100), -> new RadioButton(isChecked: true)

  render: =>
    {$unchecked, $checked} = @state()

    z '.z-radio-button-demo',
      z '.light',
        z $unchecked[0],
          colors:
            c500: paperColors.$blue500
        z $checked[2],
          colors:
            c500: paperColors.$blue500
        z $unchecked[3],
          colors:
            c500: paperColors.$blue500
          isDisabled: true
        z $checked[4],
          colors:
            c500: paperColors.$blue500
          isDisabled: true
      z '.dark',
        z $unchecked[5],
          colors:
            c500: paperColors.$blue500
          isDark: true
        z $checked[6],
          colors:
            c500: paperColors.$blue500
          isDark: true
        z $unchecked[7],
          colors:
            c500: paperColors.$blue500
          isDisabled: true
          isDark: true
        z $checked[8],
          colors:
            c500: paperColors.$blue500
          isDisabled: true
          isDark: true
