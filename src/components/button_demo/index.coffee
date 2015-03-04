z = require 'zorium'
paperColors = require 'zorium-paper/colors.json'
Button = require 'zorium-paper/button'

styles = require './index.styl'

module.exports = class ButtonDemo
  constructor: ->
    styles.use()

    @state = z.state
      $buttons: _.map _.range(100), -> new Button()

  render: =>
    {$buttons} = @state()

    i = 0
    # coffeelint: disable=no_plusplus
    z '.z-button-demo',
      z '.light',
        z $buttons[i++],
          text: 'click me'
        z $buttons[i++],
          text: 'click me'
          isDisabled: true
        z $buttons[i++],
          text: 'click me'
          colors:
            ink: paperColors.$red500
        z $buttons[i++],
          text: 'click me'
          isDisabled: true
          colors:
            ink: paperColors.$red500
        z $buttons[i++],
          text: 'click me'
          type: 'submit'
      z '.dark',
        z $buttons[i++],
          text: 'click me'
          isDark: true
        z $buttons[i++],
          text: 'click me'
          isDisabled: true
          isDark: true
        z $buttons[i++],
          text: 'click me'
          isDark: true
          colors:
            ink: paperColors.$red500
        z $buttons[i++],
          text: 'click me'
          isDisabled: true
          isDark: true
          colors:
            ink: paperColors.$red500
      z '.light',
        z $buttons[i++],
          text: 'click me'
          isRaised: true
          colors:
            cText: paperColors.$blue500Text
            c200: paperColors.$blue200
            c500: paperColors.$blue500
            c600: paperColors.$blue600
            c700: paperColors.$blue700
        z $buttons[i++],
          text: 'click me'
          isRaised: true
          colors:
            cText: paperColors.$blue500Text
            c200: paperColors.$blue200
            c500: paperColors.$blue500
            c600: paperColors.$blue600
            c700: paperColors.$blue700
          isDisabled: true
        z $buttons[i++],
          text: 'click me'
          isRaised: true
          colors:
            cText: paperColors.$red500
            c200: paperColors.$blue200
            c500: paperColors.$blue500
            c600: paperColors.$blue600
            c700: paperColors.$blue700
            ink: paperColors.$red500
        z $buttons[i++],
          text: 'click me'
          isRaised: true
          colors:
            cText: paperColors.$red500
            c200: paperColors.$blue200
            c500: paperColors.$blue500
            c600: paperColors.$blue600
            c700: paperColors.$blue700
            ink: paperColors.$red500
          isDisabled: true
      z '.dark',
        z $buttons[i++],
          text: 'click me'
          isRaised: true
          colors:
            cText: paperColors.$blue500Text
            c200: paperColors.$blue200
            c500: paperColors.$blue500
            c600: paperColors.$blue600
            c700: paperColors.$blue700
          isDark: true
        z $buttons[i++],
          text: 'click me'
          isRaised: true
          colors:
            cText: paperColors.$blue500Text
            c200: paperColors.$blue200
            c500: paperColors.$blue500
            c600: paperColors.$blue600
            c700: paperColors.$blue700
          isDisabled: true
          isDark: true
        z $buttons[i++],
          text: 'click me'
          isRaised: true
          colors:
            cText: paperColors.$red500
            c200: paperColors.$blue200
            c500: paperColors.$blue500
            c600: paperColors.$blue600
            c700: paperColors.$blue700
            ink: paperColors.$red500
          isDark: true
        z $buttons[i++],
          text: 'click me'
          isRaised: true
          colors:
            cText: paperColors.$red500
            c200: paperColors.$blue200
            c500: paperColors.$blue500
            c600: paperColors.$blue600
            c700: paperColors.$blue700
            ink: paperColors.$red500
          isDisabled: true
          isDark: true
      # coffeelint: enable=no_plusplus
