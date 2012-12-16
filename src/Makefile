TARGET_BASE = '../_site'
BOOTSTRAP_CSS = ${TARGET_BASE}/css/bootstrap.min.css
STYLESHEET = ${TARGET_BASE}/css/a.css
TMP_STYLESHEET = ${TARGET_BASE}/css/tmp.css
JSAPP = ${TARGET_BASE}/js/app.min.js
JQUERY = ${TARGET_BASE}/js/jquery.min.js
IMG_DIR = ${TARGET_BASE}/img

.PHONY: dirs

default: dirs ${STYLESHEET} ${JQUERY} ${JSAPP} ${BOOTSTRAP_CSS} ${IMG_DIR}

dirs:
	mkdir -p ${TARGET_BASE}/js
	mkdir -p ${TARGET_BASE}/css
	mkdir -p ${TARGET_BASE}/img

${BOOTSTRAP_CSS}:
	cd bootstrap && make

${JQUERY}: js/jquery.min.js
	cp $? $@

${STYLESHEET}: ./css/a.css
	cat $? > ${TMP_STYLESHEET}
	pygmentize -S default -f html >> ${TMP_STYLESHEET}
	recess --compress ${TMP_STYLESHEET} > ${STYLESHEET}
	rm ${TMP_STYLESHEET}

${JSAPP}: js/app.coffee
	coffee -p $? | uglifyjs > $@

${IMG_DIR}: img
	cp -R $?/* $@
	mv $@/favicon.ico ${TARGET_BASE}