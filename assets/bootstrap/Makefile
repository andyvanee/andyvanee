BOOTSTRAP_LESS = './less/bootstrap.less'
TARGET_BASE = '../../build/assets'
#
# BUILD SIMPLE BOOTSTRAP DIRECTORY
# lessc & uglifyjs are required
#
.PHONY: bootstrap

bootstrap:
	mkdir -p ${TARGET_BASE}/img ${TARGET_BASE}/css
	cp img/* ${TARGET_BASE}/img
	recess --compress ${BOOTSTRAP_LESS} > ${TARGET_BASE}/css/bootstrap.min.css
