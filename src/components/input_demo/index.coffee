z = require 'zorium'
paperColors = require 'zorium-paper/colors.json'
Input = require 'zorium-paper/input'

styles = require './index.styl'

module.exports = class InputDemo
  constructor: ->
    styles.use()

    @state = z.state
      $inputs: _.map _.range(100), -> new Input()
      $errors: _.map _.range(100), ->
        new Input(o_error: z.observe 'Input is required')

  render: =>
    {$inputs, $errors} = @state()

    z '.z-radio-button-demo',
      z '.light',
        z $inputs[0],
          hintText: 'hint text'
          colors:
            c500: paperColors.$blue500
        z $errors[1],
          hintText: 'hint text'
          colors:
            c500: paperColors.$blue500
        z $inputs[2],
          hintText: 'hint text'
          colors:
            c500: paperColors.$blue500
          isFloating: true
        z $errors[3],
          hintText: 'hint text'
          colors:
            c500: paperColors.$blue500
          isFloating: true
        z $inputs[4],
          hintText: 'hint text'
          colors:
            c500: paperColors.$blue500
          isDisabled: true
      z '.dark',
        z $inputs[5],
          hintText: 'hint text'
          colors:
            c500: paperColors.$blue500
          isDark: true
        z $errors[6],
          hintText: 'hint text'
          colors:
            c500: paperColors.$blue500
          isDark: true
        z $inputs[7],
          hintText: 'hint text'
          colors:
            c500: paperColors.$blue500
          isFloating: true
          isDark: true
        z $errors[8],
          hintText: 'hint text'
          colors:
            c500: paperColors.$blue500
          isFloating: true
          isDark: true
        z $inputs[9],
          hintText: 'hint text'
          colors:
            c500: paperColors.$blue500
          isDisabled: true
          isDark: true
