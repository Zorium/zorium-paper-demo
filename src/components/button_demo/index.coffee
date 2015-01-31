z = require 'zorium'

Button = require '../button'
styles = require './index.styl'
styleVars = require 'zorium/colors.json'

module.exports = class ButtonDemo
  constructor: ->
    styles.use()

    @state = z.state
      lightFlat: [
        new Button
          text: 'click me'
        new Button
          text: 'click me'
          isDisabled: true
        new Button
          text: 'click me'
          colors:
            ink: styleVars.$red500
        new Button
          text: 'click me'
          isDisabled: true
          colors:
            ink: styleVars.$red500
      ]
      darkFlat: [
        new Button
          text: 'click me'
          isDark: true
        new Button
          text: 'click me'
          isDisabled: true
          isDark: true
        new Button
          text: 'click me'
          isDark: true
          colors:
            ink: styleVars.$red500
        new Button
          text: 'click me'
          isDisabled: true
          isDark: true
          colors:
            ink: styleVars.$red500
      ]
      lightRaised: [
        new Button
          text: 'click me'
          isRaised: true
          colors:
            cText: styleVars.$blue500Text
            c200: styleVars.$blue200
            c500: styleVars.$blue500
            c600: styleVars.$blue600
            c700: styleVars.$blue700
        new Button
          text: 'click me'
          isRaised: true
          colors:
            cText: styleVars.$blue500Text
            c200: styleVars.$blue200
            c500: styleVars.$blue500
            c600: styleVars.$blue600
            c700: styleVars.$blue700
          isDisabled: true
        new Button
          text: 'click me'
          isRaised: true
          colors:
            cText: styleVars.$red500
            c200: styleVars.$blue200
            c500: styleVars.$blue500
            c600: styleVars.$blue600
            c700: styleVars.$blue700
            ink: styleVars.$red500
        new Button
          text: 'click me'
          isRaised: true
          colors:
            cText: styleVars.$red500
            c200: styleVars.$blue200
            c500: styleVars.$blue500
            c600: styleVars.$blue600
            c700: styleVars.$blue700
            ink: styleVars.$red500
          isDisabled: true
      ]
      darkRaised: [
        new Button
          text: 'click me'
          isRaised: true
          colors:
            cText: styleVars.$blue500Text
            c200: styleVars.$blue200
            c500: styleVars.$blue500
            c600: styleVars.$blue600
            c700: styleVars.$blue700
          isDark: true
        new Button
          text: 'click me'
          isRaised: true
          colors:
            cText: styleVars.$blue500Text
            c200: styleVars.$blue200
            c500: styleVars.$blue500
            c600: styleVars.$blue600
            c700: styleVars.$blue700
          isDisabled: true
          isDark: true
        new Button
          text: 'click me'
          isRaised: true
          colors:
            cText: styleVars.$red500
            c200: styleVars.$blue200
            c500: styleVars.$blue500
            c600: styleVars.$blue600
            c700: styleVars.$blue700
            ink: styleVars.$red500
          isDark: true
        new Button
          text: 'click me'
          isRaised: true
          colors:
            cText: styleVars.$red500
            c200: styleVars.$blue200
            c500: styleVars.$blue500
            c600: styleVars.$blue600
            c700: styleVars.$blue700
            ink: styleVars.$red500
          isDisabled: true
          isDark: true
      ]

  render: ({lightFlat, darkFlat, lightRaised, darkRaised}) ->
    z '.z-button-demo',
      z '.light',
        lightFlat
      z '.dark',
        darkFlat
      z '.light',
        lightRaised
      z '.dark',
        darkRaised
