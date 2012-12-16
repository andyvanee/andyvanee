SITE_TARGET = ./public

default: run

run: build
	@ cd _site && python -m SimpleHTTPServer 8000

build: build-site build-assets combine

combine:
	mkdir -p public
	cp -r build/assets/* public/
	cp -r build/pages/* public/

copy-static:
	@ echo andyvanee.com > ${SITE_TARGET}/CNAME
	@ echo 'url: http://andyvanee.com' > ${SITE_TARGET}/_config.yml
	@ echo 'gitdir: ../.git/modules/site' > ${SITE_TARGET}/.git

build-site:
	@ jekyll

build-assets:
	cd src && make
