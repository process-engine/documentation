#!/bin/bash

# install svgexport
npm install -g svgexport

# install ebook-convert
## download calibre
curl --location --output calibre.dmg https://calibre-ebook.com/dist/osx

## mount the calibre.dmg to a random temporary folder
TEMP_DIR=`mktemp -d`
hdiutil attach -mountpoint $TEMP_DIR calibre.dmg

## copy the calibre.app to the Applications-folder
sudo cp -r $TEMP_DIR/calibre.app /Applications/calibre.app

## symlink ebook-convert to make it runnable
sudo ln -s /Applications/calibre.app/Contents/MacOS/ebook-convert /usr/local/bin/ebook-convert

## unmount the calibre.dmg
hdiutil detach -force $TEMP_DIR

## remove the temporary mount-folder and the downloaded calibre.dmg
rm -r $TEMP_DIR
rm calibre.dmg
