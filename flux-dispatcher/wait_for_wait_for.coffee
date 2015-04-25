flux   = require 'flux'
Dispatcher = new flux.Dispatcher

wait_ids  = []
wait_ids2 = []

Dispatcher.register (action) ->
  Dispatcher.waitFor wait_ids
  console.log "1 - #{JSON.stringify action}"
  Dispatcher.waitFor wait_ids2
  console.log "done"

wait_ids.push Dispatcher.register (action) ->
  console.log "2 - #{JSON.stringify action}"

wait_ids2.push Dispatcher.register (action) ->
  console.log "3 - #{JSON.stringify action}"

console.log "wait_ids  #{wait_ids}"
console.log "wait_ids2 #{wait_ids2}"

Dispatcher.dispatch
  actionType: 'add-food'
  food: 'beef'


## 2->1->3->done
