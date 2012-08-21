BOOTSTRAP_LESS = ./less/bootstrap.less
#
# BUILD SIMPLE BOOTSTRAP DIRECTORY
# lessc & uglifyjs are required
#

bootstrap:
	cp img/* ../../img/
	recess --compress ${BOOTSTRAP_LESS} > ../../css/bootstrap.min.css
	cp ../../css/bootstrap.min.css ../../_site/css/bootstrap.min.css

.PHONY: bootstrap
