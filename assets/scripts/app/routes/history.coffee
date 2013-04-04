define ['exports', 'module', 'ember'], (Exports, Module, Ember) ->
    history = Ember.Route.extend(
        setupController: (controller, model)->
            controller.set 'history', model
        model: ->
            return Jukebox.History.find()
    )

    Module.exports =  history
