#!/usr/bin/env bash

set -e
set -x

rm -rf build
mkdir build
pushd build
qmake ..
make

# Icon stuff mock
wget https://upload.wikimedia.org/wikipedia/commons/1/17/Yin_yang.svg
mv Yin_yang.svg "App with a space in name.svg"

# Download lastest linuxdeploy and run it against this project
wget https://github.com/linuxdeploy/linuxdeploy/releases/download/continuous/linuxdeploy-x86_64.AppImage
chmod +x linuxdeploy*.AppImage
./linuxdeploy-x86_64.AppImage --create-desktop-file --appdir=AppDir -e "App with a space in name" -i "App with a space in name.svg"
