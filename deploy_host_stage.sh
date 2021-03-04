#!/bin/bash

OPT_DIR="opt"
APP="test-react-app"
WWW_DIR="/var/www/html/game"

if [ ! -d $OPT_DIR ]; then
    mkdir $OPT_DIR
fi

cd ./$OPT_DIR

if [ ! -d $APP ]; then
    git clone https://gitlab.com/zoosmand/$APP.git
    FIRST_INSTALL=true
fi

cd ./$APP

if [[ "Already up to date." != `git pull` ]] || [[ "$FIRST_INSTALL" == "true" ]]; then
    echo "Prepate to update."
    git pull
    yarn install
    CI=true yarn test
    yarn build
    cd ./build
    rsync -AXRrulpz --force --delete . $WWW_DIR
else
    echo "Up to date."
fi

exit 0
