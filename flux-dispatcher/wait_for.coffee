flux   = require 'flux'
Dispatcher = new flux.Dispatcher

wait_ids = []

Dispatcher.register (action) ->
  Dispatcher.waitFor wait_ids
  console.log "1 - #{JSON.stringify action}"

wait_ids.push Dispatcher.register (action) ->
  console.log "2 - #{JSON.stringify action}"

Dispatcher.register (action) ->
  console.log "3 - #{JSON.stringify action}"

Dispatcher.dispatch
  actionType: 'add-food'
  food: 'beef'
