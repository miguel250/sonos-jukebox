# List of controller to be loaded
define ['exports', 'module',
'cs!app/routes/index', 'cs!app/routes/history',
'cs!app/routes/search'], (Exports, Module, IndexRoute, HistoryRoute, SearchRoute) ->
    Module.exports =  {
        IndexRoute: IndexRoute
        HistoryRoute: HistoryRoute
        SearchRoute: SearchRoute
    }