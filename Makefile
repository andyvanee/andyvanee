SITE_BASE = ./public

default: public

run: public
	@ cd public && python -m SimpleHTTPServer 8000

public: combine copy-static

combine: build-jekyll build-assets
	@ echo Combining build directories into /public
	@ mkdir -p public
	@ cp -r build/assets/* public/
	@ cp -r build/jekyll/* public/

copy-static:
	@ echo Copying static resources
	@ mkdir -p public/css public/img
	@ cp -r assets/img/* public/img
	@ cp assets/favicon.ico ./public
	@ cp README.md ./public 
	@ echo andyvanee.com > ${SITE_BASE}/CNAME
	@ echo 'url: http://andyvanee.com' > ${SITE_BASE}/_config.yml

build-jekyll:
	@ jekyll

clean:
	@ rm -rf build
	@ echo "Cleaning build/"

distclean: clean
	@ rm -rf public/*
	@ echo "Cleaning public/"

# Asset Targets
BOOTSTRAP_CSS = build/assets/css/bootstrap.min.css
JSAPP = build/assets/js/app.min.js
STYLESHEET = build/assets/css/a.css
JQUERY = build/assets/js/jquery.min.js

build-assets: ${STYLESHEET} ${JQUERY} ${JSAPP} ${BOOTSTRAP_CSS}

${JQUERY}: assets/js/jquery.min.js
	@ mkdir -p build/assets/js
	cp $? $@

TMP_STYLESHEET = build/assets/css/tmp.css
${STYLESHEET}: assets/css/a.css
	@ mkdir -p build/assets/css
	cat $? > ${TMP_STYLESHEET}
	pygmentize -S default -f html >> ${TMP_STYLESHEET}
	recess --compress ${TMP_STYLESHEET} > ${STYLESHEET}
	rm ${TMP_STYLESHEET}

${JSAPP}: assets/js/app.coffee
	@ mkdir -p build/assets/js
	coffee -p $? | uglifyjs > $@

#
# BUILD SIMPLE BOOTSTRAP DIRECTORY
# lessc & uglifyjs are required
#
BOOTSTRAP_LESS = assets/bootstrap/less/bootstrap.less
${BOOTSTRAP_CSS}: ${BOOTSTRAP_LESS}
	@ mkdir -p build/assets/img build/assets/css
	cp assets/bootstrap/img/* build/assets/img
	recess --compress ${BOOTSTRAP_LESS} > ${BOOTSTRAP_CSS}
