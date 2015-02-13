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

    z '.z-button-demo',
      z '.light',
        z $buttons[0],
          text: 'click me'
        z $buttons[1],
          text: 'click me'
        z $buttons[2],
          text: 'click me'
          isDisabled: true
        z $buttons[3],
          text: 'click me'
          colors:
            ink: paperColors.$red500
        z $buttons[4],
          text: 'click me'
          isDisabled: true
          colors:
            ink: paperColors.$red500
      z '.dark',
        z $buttons[5],
          text: 'click me'
          isDark: true
        z $buttons[6],
          text: 'click me'
          isDisabled: true
          isDark: true
        z $buttons[7],
          text: 'click me'
          isDark: true
          colors:
            ink: paperColors.$red500
        z $buttons[8],
          text: 'click me'
          isDisabled: true
          isDark: true
          colors:
            ink: paperColors.$red500
      z '.light',
        z $buttons[9],
          text: 'click me'
          isRaised: true
          colors:
            cText: paperColors.$blue500Text
            c200: paperColors.$blue200
            c500: paperColors.$blue500
            c600: paperColors.$blue600
            c700: paperColors.$blue700
        z $buttons[10],
          text: 'click me'
          isRaised: true
          colors:
            cText: paperColors.$blue500Text
            c200: paperColors.$blue200
            c500: paperColors.$blue500
            c600: paperColors.$blue600
            c700: paperColors.$blue700
          isDisabled: true
        z $buttons[11],
          text: 'click me'
          isRaised: true
          colors:
            cText: paperColors.$red500
            c200: paperColors.$blue200
            c500: paperColors.$blue500
            c600: paperColors.$blue600
            c700: paperColors.$blue700
            ink: paperColors.$red500
        z $buttons[12],
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
        z $buttons[13],
          text: 'click me'
          isRaised: true
          colors:
            cText: paperColors.$blue500Text
            c200: paperColors.$blue200
            c500: paperColors.$blue500
            c600: paperColors.$blue600
            c700: paperColors.$blue700
          isDark: true
        z $buttons[14],
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
        z $buttons[15],
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
        z $buttons[16],
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
