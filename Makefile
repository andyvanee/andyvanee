SITE_BASE = ./public
ASSET_BASE = 'build/assets'

default: public

run: public
	@ cd public && python -m SimpleHTTPServer 8000

public: combine copy-static

combine: build-jekyll build/assets 
	mkdir -p public
	cp -r build/assets/* public/
	cp -r build/jekyll/* public/

copy-static:
	@ echo andyvanee.com > ${SITE_BASE}/CNAME
	@ echo 'url: http://andyvanee.com' > ${SITE_BASE}/_config.yml
	@ echo 'gitdir: ../.git/modules/public' > ${SITE_BASE}/.git

build-jekyll:
	@ jekyll

clean:
	@ rm -rf build
	@ echo "Cleaning build/"

dist-clean: clean
	@ rm -rf public
	@ echo "Cleaning public/"

BOOTSTRAP_CSS = ${ASSET_BASE}/css/bootstrap.min.css
STYLESHEET = ${ASSET_BASE}/css/a.css
TMP_STYLESHEET = ${ASSET_BASE}/css/tmp.css
JSAPP = ${ASSET_BASE}/js/app.min.js
JQUERY = ${ASSET_BASE}/js/jquery.min.js
IMG_DIR = ${ASSET_BASE}/img

build/assets: ${STYLESHEET} ${JQUERY} ${JSAPP} ${BOOTSTRAP_CSS} ${IMG_DIR}

dirs:
	mkdir -p ${ASSET_BASE}/js
	mkdir -p ${ASSET_BASE}/css
	mkdir -p ${ASSET_BASE}/img

${BOOTSTRAP_CSS}:
	cd assets/bootstrap && make

${JQUERY}: assets/js/jquery.min.js
	cp $? $@

${STYLESHEET}: assets/css/a.css
	cat $? > ${TMP_STYLESHEET}
	pygmentize -S default -f html >> ${TMP_STYLESHEET}
	recess --compress ${TMP_STYLESHEET} > ${STYLESHEET}
	rm ${TMP_STYLESHEET}

${JSAPP}: assets/js/app.coffee
	coffee -p $? | uglifyjs > $@

${IMG_DIR}: assets/img
	cp -R $?/* $@
	mv $@/favicon.ico ${ASSET_BASE}
