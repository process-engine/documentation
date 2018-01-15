#!/bin/bash

# install svgexport
npm install -g svgexport

# install ebook-convert
curl --location --output calibre.dmg https://calibre-ebook.com/dist/osx
TEMP_DIR=`mktemp -d`
hdiutil attach -mountpoint $TEMP_DIR calibre.dmg
sudo cp -r $TEMP_DIR/calibre.app /Applications/calibre.app
sudo ln -s /Applications/calibre.app/Contents/MacOS/ebook-convert /usr/local/bin/ebook-convert
hdiutil detach -force $TEMP_DIR
rm -r $TEMP_DIR
rm calibre.dmg
