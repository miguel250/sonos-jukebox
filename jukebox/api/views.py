import json
import jukebox
import datetime
from jukebox.tasks import album as task_album
from flask import Blueprint, jsonify, request

main = Blueprint('api', __name__)


@main.route('/queue/<id>')
def single_queue(id):
    redis = jukebox.redis
    message = {'queue': {'id': id, 'track_ids': []}, 'tracks': []}

    urls = redis.zrange('queue', 0, -1)

    for url in urls:
        hkey = 'track:%s' % url
        info = redis.hgetall(hkey)
        info['id'] = url
        message['queue']['track_ids'].append(url)
        message['tracks'].append(info)

    resp = jsonify(message)
    resp.status_code = 200
    return resp


@main.route('/tracks', methods=['POST', 'GET'])
def queue_post():
    data = json.loads(request.data)
    redis = jukebox.redis
    track_url = data['track']['url']
    new_track = redis.sadd('track', track_url)

    hkey = 'track:%s' % track_url
    now = datetime.datetime.now()
    date = now.strftime("%Y-%m-%d")
    score_date = now.strftime("%Y%m%d")

    redis.zadd('history',  date,  int(score_date))
    redis.sadd('history:%s' % date, track_url)
    redis.zincrby('played', track_url, 1)

    if new_track:
        redis.hset(hkey, 'name', data['track'].get('name', None))
        redis.hset(hkey, 'artist', data['track'].get('artist', None))
        redis.hset(hkey, 'length', data['track'].get('length', None))
        redis.hset(hkey, 'year', data['track'].get('year', None))
        redis.hset(hkey, 'album', data['track'].get('album', None))
        redis.hset(hkey, 'album_cover', data['track'].get('album_cover', None))
        redis.hset(hkey, 'date_added', date)
        redis.hset(hkey, 'last_played', date)

        result = task_album.delay(data['track'], hkey)
        data['track']['album_cover'] = result.get(timeout=1, propagate=False)

        queue_number = redis.zcard('queue')
        queue_number += 1
        redis.zadd('queue', track_url, queue_number)
    else:
        redis.hset(hkey, 'last_played', date)
    data['track']['id'] = track_url
    resp = jsonify(data)
    resp.status_code = 200
    return resp


@main.route('/history')
def history():
    message = {}
    message['history'] = []
    message['tracks'] = []
    redis = jukebox.redis
    dates = redis.zrevrange('history', 0, -1)

    for date in dates:
        date_history = {'date': date, 'track_ids': []}
        urls = redis.smembers('history:%s' % date)
        date_history['id'] = date
        for url in urls:
            hkey = 'track:%s' % url
            info = redis.hgetall(hkey)
            info['id'] = url
            date_history['track_ids'].append(url)
            message['tracks'].append(info)

        message['history'].append(date_history)

    resp = jsonify(message)
    resp.status_code = 200
    return resp
