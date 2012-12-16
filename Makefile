default: run

run: build
	@ cd _site && python -m SimpleHTTPServer 8000

build: build-site build-assets

build-site:
	@ jekyll
	@ rm -r tag
	@ cp _config.yml _site/_config.yml
	@ echo 'gitdir: ../.git/modules/_site' > _site/.git

build-assets:
	cd src && make
