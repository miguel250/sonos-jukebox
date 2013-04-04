###### Data Structure
* sadd track
    * url

* zadd history
    * date
    * datestamp(score)

* sadd queue
    * url

* sadd history:current_date
    * url

* zset played
    * count(score)

* hset track:url
    * title
    * artist
    * length
    * year
    * album
    * album_cover
    * date_added
    * last_played