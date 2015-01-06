#!/bin/bash


cd ..
SRC=$(pwd)
echo $SRC

make -C $SRC/tools/a10/depends
make -C $SRC/tools/a10/depends/xbmc

cd ..
SRCNEXT=$(pwd)
make install -C xbmc $SRCNEXT


