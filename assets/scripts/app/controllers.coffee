# List of controller to be loaded
define ['exports', 'module',
'cs!app/controllers/index', 'cs!app/controllers/history',
'cs!app/controllers/search'], (Exports, Module, index, history, search) ->
    Module.exports = {
        IndexController: index
        HistoryController: history
        SearchController: search
    }

