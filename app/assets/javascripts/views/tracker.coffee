class Holo.Tracker extends Backbone.View

  initialize: ->
    @listenTo Holo.Dispatcher, 'tracker:send', @_send

  _send: (category, action)->
    console.log category, action
    ga('send', 'event', category, action)
