z = require 'zorium'
_ = require 'lodash'
paperColors = require 'zorium-paper/colors.json'
Button = require 'zorium-paper/button'
Dialog = require 'zorium-paper/dialog'

styles = require './index.styl'


module.exports = class DialogDemo
  constructor: ->
    styles.use()

    $actions = _.map _.range(100), -> new Button()

    @state = z.state
      active: null
      $button1: new Button()
      $button2: new Button()
      $button3: new Button()
      $dialog: new Dialog()
      dialogParams: [
        {
          title: 'This is a title'
          content: z '.text', 'this is text contents'
          onleave: =>
            @toggle()
        }
        {
          title: 'This is a title'
          content: z '.text', 'this is text contents'
          actions: [
            {
              $el: z $actions[0],
                text: 'disagree'
                isShort: true
                colors:
                  ink: paperColors.$blue500
            }
            {
              $el: z $actions[1],
                text: 'agree'
                isShort: true
                colors:
                  ink: paperColors.$blue500
            }
          ]
          onleave: =>
            @toggle()
        }
        {
          content: z '.text', 'this is text contents'
          actions: [
            {
              $el: z $actions[2],
                text: 'disagree'
                isShort: true
                colors:
                  ink: paperColors.$blue500
            }
            {
              $el: z $actions[3],
                text: 'agree'
                isShort: true
                colors:
                  ink: paperColors.$blue500
            }
          ]
          onleave: =>
            @toggle()
        }
      ]

  toggle: (index) =>
    {active, dialogParams} = @state()
    if active?
      @state.set active: null
    else
      @state.set active: dialogParams[index]

  render: =>
    {$dialog, active, $button1, $button2, $button3} = @state()

    z '.z-dialog-demo',
      z '.active',
        if active
          z $dialog, active
      z 'div',
        z '.demo',
          z $button1,
            text: 'title, content'
            isRaised: true
            onclick: =>
              @toggle(0)
        z '.demo',
          z $button2,
            text: 'title, content, actions'
            isRaised: true
            onclick: =>
              @toggle(1)
        z '.demo',
          z $button3,
          text: 'content, actions'
          isRaised: true
          onclick: =>
            @toggle(2)
