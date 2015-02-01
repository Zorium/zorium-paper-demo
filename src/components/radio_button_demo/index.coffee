z = require 'zorium'
paperColors = require 'zorium-paper/colors.json'
RadioButton = require 'zorium-paper/radio_button'

styles = require './index.styl'

module.exports = class RadioButtonDemo
  constructor: ->
    styles.use()

    @state = z.state
      light: [
        new RadioButton
          colors:
            c500: paperColors.$blue500
        new RadioButton
          colors:
            c500: paperColors.$blue500
          isChecked: true
        new RadioButton
          colors:
            c500: paperColors.$blue500
          isDisabled: true
        new RadioButton
          colors:
            c500: paperColors.$blue500
          isChecked: true
          isDisabled: true
      ]
      dark: [
        new RadioButton
          colors:
            c500: paperColors.$blue500
          isDark: true
        new RadioButton
          colors:
            c500: paperColors.$blue500
          isChecked: true
          isDark: true
        new RadioButton
          colors:
            c500: paperColors.$blue500
          isDisabled: true
          isDark: true
        new RadioButton
          colors:
            c500: paperColors.$blue500
          isChecked: true
          isDisabled: true
          isDark: true
      ]

  render: ({light, dark}) ->
    z '.z-radio-button-demo',
      z '.light',
        light
      z '.dark',
        dark
