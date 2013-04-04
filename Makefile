export HOME = $(shell pwd)

requirement:
	$(HOME)/../python/bin/pip install -r requirements.txt --upgrade
	npm install

compile:
	@./node_modules/.bin/r.js  -o assets/scripts/build.js
	@./node_modules/.bin/lessc  assets/styles/less/main.less  public/css/main-tmp.css  --yui-compress
	@yui-compressor public/css/main-tmp.css -o public/css/main.css
	rm public/css/main-tmp.css

.PHONY: compile