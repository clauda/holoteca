class Holo.Modal extends Backbone.View
  el: 'body'

  events:
    'click .remodal-close': '_close'

  initialize: ->
    @_modernpopup = $('[data-remodal-id=curta]').remodal()
    @listenTo Holo.Dispatcher, 'modal:trigger', @_show
    @

  _show: ->
    Holo.Dispatcher.trigger 'tracker:send', 'modal', 'opened'
    @_modernpopup.open()
    @

  _close: (e)->
    Holo.Dispatcher.trigger 'tracker:send', 'modal', 'closed'
    sessionStorage.setItem 'holoteca:modal', 'closed'
