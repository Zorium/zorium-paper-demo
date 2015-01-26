z = require 'zorium'

Input = require '../input'
styles = require './index.styl'
styleVars = require '../../vars.json'

module.exports = class InputDemo
  constructor: ->
    styles.use()

    @state = z.state
      light: [
        new Input
          hintText: 'hint text'
          color500: styleVars.$blue500
        new Input
          hintText: 'hint text'
          color500: styleVars.$blue500
          o_error: z.observe 'Input is required'
        new Input
          hintText: 'hint text'
          color500: styleVars.$blue500
          isFloating: true
        new Input
          hintText: 'hint text'
          color500: styleVars.$blue500
          o_error: z.observe 'Input is required'
          isFloating: true
        new Input
          hintText: 'hint text'
          color500: styleVars.$blue500
          isDisabled: true
      ]
      dark: [
        new Input
          hintText: 'hint text'
          color500: styleVars.$blue500
          isDark: true
        new Input
          hintText: 'hint text'
          color500: styleVars.$blue500
          o_error: z.observe 'Input is required'
          isDark: true
        new Input
          hintText: 'hint text'
          color500: styleVars.$blue500
          isFloating: true
          isDark: true
        new Input
          hintText: 'hint text'
          color500: styleVars.$blue500
          o_error: z.observe 'Input is required'
          isFloating: true
          isDark: true
        new Input
          hintText: 'hint text'
          color500: styleVars.$blue500
          isDisabled: true
          isDark: true
      ]

  render: ({light, dark}) ->
    z '.z-radio-button-demo',
      z '.light',
        light
      z '.dark',
        dark