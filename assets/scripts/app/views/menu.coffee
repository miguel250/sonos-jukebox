define ['exports', 'module', 'ember',
'text!app/templates/menu.hbs'], (Exports, Module, Ember, Template) ->
    Ember.TEMPLATES['menu'] =  Ember.Handlebars.compile(Template)
    return Ember.View.extend(
        templateName: 'menu'
        tagName: 'div'
        classNames: ['navbar']
    )
