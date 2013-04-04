define ['ember', 'DS','cs!app/routes',
'cs!app/routers', 'cs!app/controllers'
'cs!app/views', 'cs!app/models'], (Ember, DS, Routes, Routers, Controllers, Views, Models) ->

  Ember.LOG_VERSION = DEBUG
  App = Ember.Application.create(
    LOG_TRANSITIONS: DEBUG
    VERSION: VERSION
    Router: Routers
  )

  DS.RESTAdapter.configure "plurals",
    queue: "queue"
    history: "history"


  DS.RESTAdapter.reopen(
    namespace: '1'
    bulkCommit: false
  )

  App.Store = DS.Store.extend(
    revision: 12
  )


  $.extend(App, Routes);
  $.extend(App, Controllers)
  $.extend(App, Views)
  $.extend(App, Models)

  App.Router.reopen location: "history"
  window.Jukebox = App;