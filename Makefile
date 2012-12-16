SITE_TARGET = ./public

default: run

run: build
	@ cd public && python -m SimpleHTTPServer 8000

build: build-site build-assets combine copy-static

combine:
	mkdir -p public
	cp -r build/assets/* public/
	cp -r build/pages/* public/

copy-static:
	@ echo andyvanee.com > ${SITE_TARGET}/CNAME
	@ echo 'url: http://andyvanee.com' > ${SITE_TARGET}/_config.yml
	@ echo 'gitdir: ../.git/modules/public' > ${SITE_TARGET}/.git

build-site:
	@ jekyll

build-assets:
	cd src && make

clean:
	@ rm -rf build
	@ echo "Cleaning build/"

dist-clean: clean
	@ rm -rf public
	@ echo "Cleaning public/"