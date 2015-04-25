flux   = require 'flux'
Dispatcher = new flux.Dispatcher

Dispatcher.register (action) ->
  console.log "1 - #{JSON.stringify action}"

Dispatcher.register (action) ->
  console.log "2 - #{JSON.stringify action}"

Dispatcher.register (action) ->
  console.log "3 - #{JSON.stringify action}"

Dispatcher.dispatch
  actionType: 'add-food'
  food: 'beef'

Dispatcher.dispatch
  foo: 'bar'

# 1->2->3
