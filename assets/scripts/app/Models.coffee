# List of controller to be loaded
define ['exports', 'module', 'cs!app/models/queue'
,'cs!app/models/history','cs!app/models/track' ], (Exports, Module, queue, history, track) ->
    Module.exports = {
        Queue: queue
        Track: track
        History: history
    }

