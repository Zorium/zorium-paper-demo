z = require 'zorium'

Checkbox = require '../checkbox'
styles = require './index.styl'
styleVars = require '../../vars.json'

module.exports = class CheckboxDemo
  constructor: ->
    styles.use()

    @state = z.state
      light: [
        new Checkbox
          color500: styleVars.$blue500
          color200: styleVars.$blue200
        new Checkbox
          color500: styleVars.$blue500
          color200: styleVars.$blue200
          isChecked: true
        new Checkbox
          color500: styleVars.$blue500
          color200: styleVars.$blue200
          isDisabled: true
        new Checkbox
          color500: styleVars.$blue500
          color200: styleVars.$blue200
          isChecked: true
          isDisabled: true
      ]
      dark: [
        new Checkbox
          color500: styleVars.$blue500
          color200: styleVars.$blue200
          isDark: true
        new Checkbox
          color500: styleVars.$blue500
          color200: styleVars.$blue200
          isChecked: true
          isDark: true
        new Checkbox
          color500: styleVars.$blue500
          color200: styleVars.$blue200
          isDisabled: true
          isDark: true
        new Checkbox
          color500: styleVars.$blue500
          color200: styleVars.$blue200
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
