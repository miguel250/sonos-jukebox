# List of views to be loaded
define ['exports', 'module',
'cs!app/views/index', 'cs!app/views/menu',
'cs!app/views/history', 'cs!app/views/search'], (Exports, Module, IndexView, MenuView, HistoryView, SearchView) ->
    Module.exports = {
        IndexView: IndexView
        MenuView: MenuView
        HistoryView: HistoryView
        SearchView: SearchView
    }