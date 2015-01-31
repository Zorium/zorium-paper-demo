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
          inkColor: styleVars.$red500
        new Button
          text: 'click me'
          isDisabled: true
          inkColor: styleVars.$red500
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
          inkColor: styleVars.$red500
        new Button
          text: 'click me'
          isDisabled: true
          isDark: true
          inkColor: styleVars.$red500
      ]
      lightRaised: [
        new Button
          text: 'click me'
          isRaised: true
          isTextLight: true
          color200: styleVars.$blue200
          color500: styleVars.$blue500
          color600: styleVars.$blue600
          color700: styleVars.$blue700
        new Button
          text: 'click me'
          isRaised: true
          isTextLight: true
          color200: styleVars.$blue200
          color500: styleVars.$blue500
          color600: styleVars.$blue600
          color700: styleVars.$blue700
          isDisabled: true
        new Button
          text: 'click me'
          isRaised: true
          isTextLight: true
          color200: styleVars.$blue200
          color500: styleVars.$blue500
          color600: styleVars.$blue600
          color700: styleVars.$blue700
          inkColor: styleVars.$red500
        new Button
          text: 'click me'
          isRaised: true
          isTextLight: true
          color200: styleVars.$blue200
          color500: styleVars.$blue500
          color600: styleVars.$blue600
          color700: styleVars.$blue700
          isDisabled: true
          inkColor: styleVars.$red500
      ]
      darkRaised: [
        new Button
          text: 'click me'
          isRaised: true
          isTextLight: true
          color200: styleVars.$blue200
          color500: styleVars.$blue500
          color600: styleVars.$blue600
          color700: styleVars.$blue700
          isDark: true
        new Button
          text: 'click me'
          isRaised: true
          isTextLight: true
          color200: styleVars.$blue200
          color500: styleVars.$blue500
          color600: styleVars.$blue600
          color700: styleVars.$blue700
          isDisabled: true
          isDark: true
        new Button
          text: 'click me'
          isRaised: true
          isTextLight: true
          color200: styleVars.$blue200
          color500: styleVars.$blue500
          color600: styleVars.$blue600
          color700: styleVars.$blue700
          isDark: true
          inkColor: styleVars.$red500
        new Button
          text: 'click me'
          isRaised: true
          isTextLight: true
          color200: styleVars.$blue200
          color500: styleVars.$blue500
          color600: styleVars.$blue600
          color700: styleVars.$blue700
          isDisabled: true
          isDark: true
          inkColor: styleVars.$red500
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
