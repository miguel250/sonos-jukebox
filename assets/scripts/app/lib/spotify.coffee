define ['module', 'jquery'], (module, $) ->
    class Spotify
        results = {}
        constructor: (query, page) ->
            page ?= '1'
            @query = query
            @page = page

            $.ajax(
                url: "http://ws.spotify.com/search/1/track.json"
                data:
                    q: query
                    page: page
                type: "GET"
                jsonp: false
                cache: true
                async: false,
                crossDomain: true
                dataType: "json"
                success: (data) ->
                    results = {'status': 'found', 'songs': [], 'pagination': []}
                    num_results = data.info.num_results
                    pages = Math.round(num_results / 100)
                    count = 1
                    pages = 1  if pages is 0

                    while pages >= count
                        results.pagination.push(count)
                        count++

                    if num_results is 0
                        results =  {'status':'not_found', 'message': 'No Results Found'}
                        return results
                     $.each data.tracks, ->
                        track = name: @name

                        num_artists = @artists.length
                        artists = []

                        $.each @artists, (key, value) ->
                            artists.push value.name

                        last_artist = ""
                        if num_artists > 1
                            last_artist = artists.pop()
                            last_artist = " And #{last_artist}"
                        artists =  artists.join(", ");
                        track['artist'] = artists

                        date = new Date(null)
                        date.setSeconds @length
                        length = date.toTimeString().substr(3, 5)
                        track['length'] = length
                        track['url'] = @href
                        track['year'] = @album.released
                        track['album'] =  @album.name
                        results['songs'].push track
                    return results
                error: ->
                    return {'status':'error', 'message': "Can't Connect to Spotify"}
            )

         result: ->
            return results
    module.exports = Spotify