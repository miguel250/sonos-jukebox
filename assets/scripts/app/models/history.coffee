define ['exports', 'module', 'DS'], (Exports, Module, DS) ->
    return  DS.Model.extend(
        'date': DS.attr('string')
        'track': DS.hasMany('window.Jukebox.Track')
    )