git checkout gh-pages
git pull
git checkout develop
git pull
git merge --strategy=ours gh-pages
git checkout gh-pages
git merge develop

npm install
npm run render_api_doc
mv -f ./public/index.html ./andere-themen/cheat-sheet/http-rest-api/apidoc.html
./node_modules/.bin/gitbook build

TEMP_DIR=`mktemp -d`
mv ./* $TEMP_DIR/
mv $TEMP_DIR/_book/* ./
rm -rf $TEMP_DIR
