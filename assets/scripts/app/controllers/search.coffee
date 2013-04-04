define ['exports', 'module', 'ember', 'cs!app/lib/spotify'], (Exports, Module, Ember, Spotify) ->
    search = Ember.ObjectController.extend(
        search: ''
        query: (->
            query = @.get 'search'
            if query?
                @transitionToRoute "search", query
        )
        songs: ((params)->
            text = decodeURIComponent(@.get('content.params.text'))

            if text != 'undefined'
                @.set 'search', text
            else
                search = @.get 'search'
                if  search == 'undefined'
                    @.set 'search', decodeURIComponent(window.location.pathname.split('/')[2])

            results = @getResult()

            if results.status == 'found'
                return {'status': true, 'result': results.songs, 'pagination': results.pagination}
            else
                return {'status': false, 'message': results.message}
        ).property('content.songs')
        getResult: ->
            spotify = new Spotify(@.get 'search' )
            return spotify.result()
        submit: (param) ->
            queue = window.Jukebox.Queue.find(1)
            track = window.Jukebox.Track.createRecord param
            queue.get('track').pushObject(track);
            queue.get('transaction').commit()
            queue.reload()
            @transitionToRoute "index"
    )
    return search