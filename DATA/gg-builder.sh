#!/bin/sh
cd /DATA/repos/grundgesetz-web/
echo "Getting submodules"
git submodule init
git submodule update
echo "Building"
make build
make create
make create
echo "Setting custom root dir"
sed -i 's/@rootDir: "/";/@rootDir: "/DATA/webroot/";/g' /DATA/repos/grundgesetz-web/kickstart.less
make less
make uglifyjs
