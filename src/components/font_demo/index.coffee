z = require 'zorium'
_ = require 'lodash'

styles = require './index.styl'

module.exports = class FontDemo
  constructor: ->
    styles.use()

    @state = z.state
      fonts: [
        'display4'
        'display3'
        'display2'
        'display1'
        'headline'
        'title'
        'subhead'
        'body2'
        'body1'
        'caption'
        'button'
      ]

  render: ({fonts}) ->
    z '.z-font-demo', _.map fonts, (font) ->
      z '.demo',
        z 'span.var', font
        z "span.text.#{font}", 'Hello World'
