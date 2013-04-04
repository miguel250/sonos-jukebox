define ['exports', 'module', 'ember'], (Exports, Module, Ember) ->
    search = Ember.Route.extend(
        renderTemplate: (controller, model)->
            if @.lastRenderedTemplate == @.routeName
                return
            return @._super();
        setupController: (controller, model)->
            controller.set 'content', model
        model: (params) ->
            return {'params': params}
        )

    Module.exports =  search
