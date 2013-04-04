define ['exports', 'module', 'DS'], (Exports, Module, DS) ->
    return  DS.Model.extend(
        'track': DS.hasMany('window.Jukebox.Track')
        )