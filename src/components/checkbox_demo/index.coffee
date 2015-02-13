z = require 'zorium'
paperColors = require 'zorium-paper/colors.json'
Checkbox = require 'zorium-paper/checkbox'

styles = require './index.styl'

module.exports = class CheckboxDemo
  constructor: ->
    styles.use()

    @state = z.state
      $unchecked: _.map _.range(100), -> new Checkbox()
      $checked: _.map _.range(100), -> new Checkbox(isChecked: true)

  render: =>
    {$unchecked, $checked} = @state()

    z '.z-checkbox-demo',
      z '.light',
        z $unchecked[0],
          colors:
            c500: paperColors.$blue500
        z $checked[1],
          colors:
            c500: paperColors.$blue500
        z $unchecked[2],
          colors:
            c500: paperColors.$blue500
          isDisabled: true
        z $checked[3],
          colors:
            c500: paperColors.$blue500
          isDisabled: true
      z '.dark',
        z $unchecked[4],
          colors:
            c500: paperColors.$blue500
          isDark: true
        z $checked[5],
          colors:
            c500: paperColors.$blue500
          isDark: true
        z $unchecked[6],
          colors:
            c500: paperColors.$blue500
          isDisabled: true
          isDark: true
        z $checked[7],
          colors:
            c500: paperColors.$blue500
          isDisabled: true
          isDark: true
