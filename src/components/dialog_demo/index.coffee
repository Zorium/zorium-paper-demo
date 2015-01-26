z = require 'zorium'
_ = require 'lodash'

Button = require '../button'
Dialog = require '../dialog'
styles = require './index.styl'
styleVars = require '../../vars.json'

module.exports = class DialogDemo
  constructor: ->
    styles.use()

    @state = z.state
      active: null
      dialogs: [
        {
          $button: new Button
            text: 'title, content'
            isRaised: true
            onclick: =>
              @toggle(0)
          $el: new Dialog
            title: 'This is a title'
            content: z '.text', 'this is text contents'
            onleave: =>
              @toggle()
        }
        {
          $button: new Button
            text: 'title, content, actions'
            isRaised: true
            onclick: =>
              @toggle(1)
          $el: new Dialog
            title: 'This is a title'
            content: z '.text', 'this is text contents'
            actions: [
              {
                $el: new Button
                  text: 'disagree'
                  isShort: true
                  inkColor: styleVars.$blue500
              }
              {
                $el: new Button
                  text: 'agree'
                  isShort: true
                  inkColor: styleVars.$blue500
              }
            ]
            onleave: =>
              @toggle()
        }
        {
          $button: new Button
            text: 'content, actions'
            isRaised: true
            onclick: =>
              @toggle(2)
          $el: new Dialog
            content: z '.text', 'this is text contents'
            actions: [
              {
                $el: new Button
                  text: 'disagree'
                  isShort: true
                  inkColor: styleVars.$blue500
              }
              {
                $el: new Button
                  text: 'agree'
                  isShort: true
                  inkColor: styleVars.$blue500
              }
            ]
            onleave: =>
              @toggle()
        }
      ]

  toggle: (index) =>
    {active, dialogs} = @state()
    if active?
      @state.set active: null
    else
      @state.set active: dialogs[index].$el

  render: ({dialogs, active}) ->
    z '.z-dialog-demo',
      z '.active', active
      _.map dialogs, (dialog) ->
        z '.demo',
          dialog.$button
