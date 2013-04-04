define ['exports', 'module', 'ember',
'text!app/templates/history.hbs'], (Exports, Module, Ember, Template) ->
    Ember.TEMPLATES['history'] =  Ember.Handlebars.compile(Template)
    return Ember.View.extend(
        templateName: 'history'
        tagName: 'div'
        classNames: ['container']
        didInsertElement: ->
            $('.nav li').removeClass 'active'
            $('#history-nav').addClass 'active'
    )
