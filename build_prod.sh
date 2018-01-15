#!/bin/bash

# make the gh-pages-branch be identical to develop
git checkout gh-pages
git pull
git checkout develop
git pull
git merge --strategy=ours gh-pages
git checkout gh-pages
git merge develop

# install the necessary dependencies to build the gitbook
npm install

# create the api-docs from the swagger.json and move it to its destination
npm run render_api_doc
mv -f ./public/index.html ./andere-themen/cheat-sheet/http-rest-api/apidoc.html

# build the gitbook
./node_modules/.bin/gitbook build

# make the root contain only the built gitbook and nothing else
TEMP_DIR=$(mktemp -d)
mv ./* $TEMP_DIR/
mv $TEMP_DIR/_book/* ./
rm -rf $TEMP_DIR
