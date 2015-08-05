class Holo.Subscriber extends Backbone.View
  el: '.page'

  events:
    'submit .is-subscription': '_submit'
    'click .is-close': '_close'

  initialize: ->
    $('#fixed_bar').slideDown('fast')
    $('#top').css 'marginTop', '62px'
    Holo.Dispatcher.trigger 'tracker:send', 'subscription', 'opened'
    @

  _close: (e)->
    if e then e.preventDefault()
    Holo.Dispatcher.trigger 'tracker:send', 'subscription', 'closed'
    $('#fixed_bar').slideUp('slow')
    $('#top').delay(800).css 'marginTop', '0'
    @

  _submit: (e)->
    e.preventDefault()
    Holo.Dispatcher.trigger 'tracker:send', 'subscription', 'submitted'
    sessionStorage.setItem 'holoteca:newsletter', 'subscribed'
    $('.is-subscription button').text("ASSINADO").attr('disabled', 'disabled');
    @_close(e)
    @