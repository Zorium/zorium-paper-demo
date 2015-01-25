z = require 'zorium'

components = [
  require '../../components/font_demo'
  require '../../components/button_demo'
]

module.exports = class HomePage
  constructor: ->
    @state = z.state
      components: _.map components, (component) ->
        new component()

  render: ({components}) ->
    z 'div', components
