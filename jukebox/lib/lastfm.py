import requests


class LastFM(object):
    URL = 'http://ws.audioscrobbler.com/2.0/'

    def __init__(self, key, method, data={}):
        self.payload = {
            'api_key': key,
            'method': method,
            'format': 'json'
        }
        self.payload.update(data)

    def add_param(self, key, value):
        self.payload[key] = value

    def make_request(self):
        r = requests.get(self.URL, params=self.payload)
        return r.json()
