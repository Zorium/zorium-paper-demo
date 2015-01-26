z = require 'zorium'
_ = require 'lodash'

components = [
  require '../../components/floating_action_button_demo'
  require '../../components/dialog_demo'
  require '../../components/checkbox_demo'
  require '../../components/radio_button_demo'
  require '../../components/button_demo'
  require '../../components/font_demo'
]

module.exports = class HomePage
  constructor: ->
    @state = z.state
      components: _.map components, (component) ->
        new component()

  render: ({components}) ->
    z 'div', components
