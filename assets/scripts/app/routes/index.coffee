define ['exports', 'module', 'ember'], (Exports, Module, Ember) ->
    index = Ember.Route.extend(
        setupController: (controller, model)->
            controller.set 'queue', model
        model: ->
            queue = Jukebox.Queue
            return  queue.find(1)
    )

    Module.exports =  index
