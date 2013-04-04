define ['exports', 'module', 'ember',
'text!app/templates/index.hbs'], (Exports, Module, Ember, Template) ->
    Ember.TEMPLATES['index'] =  Ember.Handlebars.compile(Template)
    return Ember.View.extend(
        templateName: 'index'
        tagName: 'div'
        classNames: ['container']
        didInsertElement: ->
            $('.nav li').removeClass 'active'
            $('#home-nav').addClass 'active'
    )
