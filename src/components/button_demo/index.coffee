z = require 'zorium'
paperColors = require 'zorium/colors.json'
Button = require 'zorium-paper/button'

styles = require './index.styl'

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
            ink: paperColors.$red500
        new Button
          text: 'click me'
          isDisabled: true
          colors:
            ink: paperColors.$red500
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
            ink: paperColors.$red500
        new Button
          text: 'click me'
          isDisabled: true
          isDark: true
          colors:
            ink: paperColors.$red500
      ]
      lightRaised: [
        new Button
          text: 'click me'
          isRaised: true
          colors:
            cText: paperColors.$blue500Text
            c200: paperColors.$blue200
            c500: paperColors.$blue500
            c600: paperColors.$blue600
            c700: paperColors.$blue700
        new Button
          text: 'click me'
          isRaised: true
          colors:
            cText: paperColors.$blue500Text
            c200: paperColors.$blue200
            c500: paperColors.$blue500
            c600: paperColors.$blue600
            c700: paperColors.$blue700
          isDisabled: true
        new Button
          text: 'click me'
          isRaised: true
          colors:
            cText: paperColors.$red500
            c200: paperColors.$blue200
            c500: paperColors.$blue500
            c600: paperColors.$blue600
            c700: paperColors.$blue700
            ink: paperColors.$red500
        new Button
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
      ]
      darkRaised: [
        new Button
          text: 'click me'
          isRaised: true
          colors:
            cText: paperColors.$blue500Text
            c200: paperColors.$blue200
            c500: paperColors.$blue500
            c600: paperColors.$blue600
            c700: paperColors.$blue700
          isDark: true
        new Button
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
        new Button
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
        new Button
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
