define ['exports', 'module', 'DS'], (Exports, Module, DS) ->
    return  DS.Model.extend(
        'name': DS.attr('string')
        'artist': DS.attr('string')
        'length': DS.attr('string')
        'url':  DS.attr('string')
        'year': DS.attr('number')
        'album': DS.attr('string')
        'albumCover': DS.attr('string')
        'dateAdded': DS.attr('string')
        'lastPlayed': DS.attr('string')
        )