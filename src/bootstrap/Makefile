BOOTSTRAP_LESS = ./less/bootstrap.less
#
# BUILD SIMPLE BOOTSTRAP DIRECTORY
# lessc & uglifyjs are required
#

bootstrap:
	cp img/* ../../img/
	lessc --compress ${BOOTSTRAP_LESS} > ../../css/bootstrap.min.css

.PHONY: bootstrap
