default: run

run: build
	@ cd _site && python -m SimpleHTTPServer 8000

build: build-site build-assets

build-site:
	@ jekyll
	@ rm -r tag

build-assets:
	cd src && make
