z = require 'zorium'
_ = require 'lodash'

styles = require './index.styl'

fonts = [
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

module.exports = class FontDemo
  constructor: ->
    styles.use()

  render: ->
    z '.z-font-demo', _.map fonts, (font) ->
      z '.demo',
        z 'span.var', font
        z "span.text.#{font}", 'Hello World'
