#!/bin/bash
echo "Get repos"
cd /DATA/repos/
git submodule init
git submodule update
echo "install toolchain"
cd docpatch
./configure
make
make install
