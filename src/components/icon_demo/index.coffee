z = require 'zorium'
paperColors = require 'zorium-paper/colors.json'
Icon = require 'zorium-paper/icon'

styles = require './index.styl'

module.exports = class IconDemo
  constructor: ->
    styles.use()

    @state = z.state
      $icons: _.map _.range(100), -> new Icon()

  render: =>
    {$icons} = @state()

    z '.z-icon-demo',
      z '.light',
        z $icons[0],
          icon: 'cake-variant'
        z $icons[1],
          icon: 'camera-iris'
        z $icons[2],
          icon: 'cake-variant'
          isInactive: true
      z '.dark',
        z $icons[3],
          icon: 'cake-variant'
          isDark: true
        z $icons[4],
          icon: 'camera-iris'
          isDark: true
        z $icons[5],
          icon: 'cake-variant'
          isInactive: true
          isDark: true
