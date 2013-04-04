define ['exports', 'module', 'ember',
'text!app/templates/search.hbs'], (Exports, Module, Ember, Template) ->
    Ember.TEMPLATES['search'] =  Ember.Handlebars.compile(Template)
    return Ember.View.extend(
        elementId: 'search'
        templateName: 'search'
        tagName: 'div'
        classNames: ['container']
    )
