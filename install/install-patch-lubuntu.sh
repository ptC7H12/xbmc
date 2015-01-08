#!/bin/bash

#Patches provided by jogi36de [lemaker.org forum]

echo ""
echo "/xbmc/filesystem/SMBDirectory.cpp wird gepatcht!"
cp ./patches/xbmc-bp-patch6.patch ../../
patch -p1 < ../../xbmc-bp-patch6.patch
rm ../../xbmc-bp-patch6.patch

echo ""
echo "/xbmc/filesystem/SmbFile.cpp wird gepatcht!"
cp ./patches/xbmc-bp-patch7.patch ../../
patch -p1 < ../../xbmc-bp-patch7.patch
rm ../../xbmc-bp-patch7.patch