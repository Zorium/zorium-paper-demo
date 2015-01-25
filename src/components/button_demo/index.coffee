z = require 'zorium'

Button = require '../button'
styles = require './index.styl'
styleVars = require '../../vars.json'

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
      ]
      darkFlat: [
        new Button
          text: 'click me'
          isDark: true
        new Button
          text: 'click me'
          isDisabled: true
          isDark: true
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
