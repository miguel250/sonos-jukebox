define ['exports', 'module', 'ember'], (Exports, Module, Ember) ->
    history = Ember.ObjectController.extend(
        search: '',
        query: (router)->
            query = @.get 'search'
            @transitionToRoute "search", query
    )
    return history