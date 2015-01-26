z = require 'zorium'

styles = require './index.styl'
styleVars = require '../../vars.json'

module.exports = class Input
  constructor: ({color500, hintText, isFloating,
                isDisabled, @o_value, @o_error, isDark}) ->
    styles.use()

    hintText ?= ''
    isFloating ?= false
    isDisabled ?= false
    @o_value ?= z.observe ''
    @o_error ?= z.observe null

    @o_isFocused = z.observe false

    @state = z.state {
      color500
      hintText
      isFocused: @o_isFocused
      value: @o_value
      error: @o_error
      isFloating
      isDisabled
      isDark
    }

  # coffeelint: disable=cyclomatic_complexity
  render: ({color500, hintText, isFloating,
            isDisabled, value, isFocused, error, isDark}) ->
    o_value = @o_value
    o_isFocused = @o_isFocused

    z ".z-input#{isDark and '.dark' or ''}#{isFloating and '.floating' or ''}",
      z ".hint
        #{if value isnt '' and not isFloating then '.hidden' \
          else if value isnt '' then '.floating'
          else ''}",
        hintText
      z "input.input#{isDisabled and '[disabled]' or ''}",
        value: value
        # coffeelint: disable=missing_fat_arrows
        oninput: ->
          o_value.set this.value
        onfocus: ->
          o_isFocused.set true
        onblur: ->
          o_isFocused.set false
        # coffeelint: enable=missing_fat_arrows
      z ".underline#{isFocused and '.focused' or ''}
          #{isDisabled and '.disabled' or ''}
          #{error? and '.isError'}",
          style:
            backgroundColor: if isFocused and not error? then color500 else null
      if error?
        z '.error', error
    # coffeelint: enable=cyclomatic_complexity
