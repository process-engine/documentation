npm run render_api_doc
mv -f ./public/index.html ./andere-themen/cheat-sheet/http-rest-api/apidoc.html
./node_modules/.bin/gitbook build

mkdir cache
mv ./!(cache) ./cache/
mv ./cache/_book/* ./
rm -rf cache
