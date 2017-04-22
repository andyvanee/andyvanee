default: build

.PHONY: build
build:
	bundle exec middleman build --build-dir=docs --verbose
