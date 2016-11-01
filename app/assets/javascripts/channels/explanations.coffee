App.explanations = App.cable.subscriptions.create 'ExplanationsChannel',
  connected: ->
    # Called when the subscription is ready for use on the server
    return
  disconnected: ->
    # Called when the subscription has been terminated by the server
    return
  received: (data) ->
    alert data['explanation']
    # Called when theres incoming data on the websocket for this channel
    return
  add: (explanation)->
    @perform 'add', explanation: explanation
