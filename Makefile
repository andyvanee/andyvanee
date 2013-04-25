SITE_BASE = ./build

default: build

run: build
	@ cd build && python -m SimpleHTTPServer

build: combine copy-static

combine: build-jekyll build-assets
	# Combining build directories into /build
	@ mkdir -p build
	@ cp -r tmp/assets/* build/
	@ cp -r tmp/jekyll/* build/

copy-static:
	# Copying static resources
	@ mkdir -p build/css build/img
	@ cp -r assets/img/* build/img
	@ cp assets/favicon.ico ./build
	@ cp README.md ./build
	@ echo andyvanee.com > ${SITE_BASE}/CNAME
	@ echo 'url: http://andyvanee.com' > ${SITE_BASE}/_config.yml

build-jekyll:
	@ jekyll

clean:
	# Cleaning tmp/
	@ rm -rf tmp

distclean: clean
	# Cleaning build/
	@ rm -rf build/*

# Asset Targets
BOOTSTRAP_CSS = tmp/assets/css/bootstrap.min.css
JSAPP = tmp/assets/js/app.min.js
STYLESHEET = tmp/assets/css/a.css
JQUERY = tmp/assets/js/jquery.min.js

build-assets: ${STYLESHEET} ${JQUERY} ${JSAPP} ${BOOTSTRAP_CSS}

${JQUERY}: assets/js/jquery.min.js
	@ mkdir -p tmp/assets/js
	cp $? $@

TMP_STYLESHEET = tmp/assets/css/tmp.css
${STYLESHEET}: assets/css/a.css
	@ mkdir -p tmp/assets/css
	cat $? > ${TMP_STYLESHEET}
	pygmentize -S default -f html >> ${TMP_STYLESHEET}
	recess --compress ${TMP_STYLESHEET} > ${STYLESHEET}
	rm ${TMP_STYLESHEET}

${JSAPP}: assets/js/app.js
	@ mkdir -p tmp/assets/js
	uglifyjs $? > $@

#
# BUILD SIMPLE BOOTSTRAP DIRECTORY
# lessc & uglifyjs are required
#
BOOTSTRAP_LESS = assets/bootstrap/less/bootstrap.less
${BOOTSTRAP_CSS}: ${BOOTSTRAP_LESS}
	@ mkdir -p tmp/assets/img tmp/assets/css
	cp assets/bootstrap/img/* tmp/assets/img
	recess --compress ${BOOTSTRAP_LESS} > ${BOOTSTRAP_CSS}
