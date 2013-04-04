# List of controller to be loaded
define ['exports', 'module', 'ember'], (Exports, Module, Ember) ->
     router = Ember.Router.extend()
     router.map ->
        @route("history")
        @resource("search" , { path: '/search/:text' })
        return @
     return router