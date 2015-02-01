z = require 'zorium'
paperColors = require 'zorium-paper/colors.json'
Checkbox = require 'zorium-paper/checkbox'

styles = require './index.styl'

module.exports = class CheckboxDemo
  constructor: ->
    styles.use()

    @state = z.state
      light: [
        new Checkbox
          colors:
            c500: paperColors.$blue500
        new Checkbox
          colors:
            c500: paperColors.$blue500
          isChecked: true
        new Checkbox
          colors:
            c500: paperColors.$blue500
          isDisabled: true
        new Checkbox
          colors:
            c500: paperColors.$blue500
          isChecked: true
          isDisabled: true
      ]
      dark: [
        new Checkbox
          colors:
            c500: paperColors.$blue500
          isDark: true
        new Checkbox
          colors:
            c500: paperColors.$blue500
          isChecked: true
          isDark: true
        new Checkbox
          colors:
            c500: paperColors.$blue500
          isDisabled: true
          isDark: true
        new Checkbox
          colors:
            c500: paperColors.$blue500
          isChecked: true
          isDisabled: true
          isDark: true
      ]

  render: ({light, dark}) ->
    z '.z-checkbox-demo',
      z '.light',
        light
      z '.dark',
        dark
