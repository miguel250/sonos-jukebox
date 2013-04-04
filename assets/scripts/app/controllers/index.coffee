define ['exports', 'module', 'ember'], (Exports, Module, Ember) ->
    index = Ember.ObjectController.extend(
        search: '',
        query: ->
            query = @.get 'search'
            @transitionToRoute "search", query
    )
    return index