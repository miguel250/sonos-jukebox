import jukebox
from celery import Celery
from jukebox.lib.lastfm import LastFM

celery = Celery(
    'jukebox.tasks',
    broker='redis://localhost:6379/0',
    backend='redis://localhost:6379/0'
)

celery.conf.update(
    CELERY_TASK_RESULT_EXPIRES=3600,
)


@celery.task
def album(info, hkey):
    app = jukebox.app
    redis = jukebox.redis
    key = app.config['LASTFM_KEY']
    cover = None

    payload = {
        'artist': info['artist'],
        'album': info['album']
    }

    lastfm = LastFM(key, 'album.getinfo', payload)
    result = lastfm.make_request()
    for image in result['album']['image']:
        if image['size'] == 'extralarge':
            cover = image['#text']
    redis.hset(hkey, 'album_cover', cover)
    print redis.hget(hkey, 'album_cover')
    return cover
