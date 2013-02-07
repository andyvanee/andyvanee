#!/bin/bash

cd public
python -m SimpleHTTPServer 8000 &
PY_APP=$!
cd ../server
bundle exec ruby myapp.rb &
RB_APP=$!
trap "{ kill $RB_APP ; kill $PY_APP; exit 0; }" SIGINT SIGTERM
while : true; do sleep 2; done
