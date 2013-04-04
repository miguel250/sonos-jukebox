import os
import urls
import redis
from flask import Flask


class Settings(object):
    def __init__(self):
        self.root_path = os.getcwd()
        self.app = Flask(__name__)
        path = os.path.join(self.root_path, "config/base.cfg")
        self.app.config.from_pyfile(path)
        self.environment()
        self.redis()
        self.blueprints()

    def redis(self):
        pool = redis.ConnectionPool(
            host=self.app.config['HOST_NAME'],
            port=self.app.config['PORT'],
            db=self.app.config['DATABASE']
        )
        self.redis = redis.Redis(connection_pool=pool)

    def asset_version(self):
        version = self.redis.get('asset_version')
        if version is None:
            version = '0.0.1'
            self.redis.set('asset_version', version)
        return version

    def environment(self):
        try:
            environment = os.environ['ENVIRONMENT']
            if environment == 'development':
                path = os.path.join(self.root_path, "config/development.cfg")
                self.app.config.from_pyfile(path)
            elif environment == 'production':
                path = os.path.join(self.root_path, "config/production.cfg")
                self.app.config.from_pyfile(path)
            elif environment == 'testing':
                path = os.path.join(self.root_path, "config/testing.cfg")
                self.app.config.from_pyfile(path)
        except KeyError:
            pass

    def blueprints(self):
        for key in urls.prints.keys():
            self.app.register_blueprint(key, url_prefix=urls.prints[key])

settings = Settings()
redis = settings.redis
app = settings.app
app.jinja_env.globals.update(asset_version=settings.asset_version)
