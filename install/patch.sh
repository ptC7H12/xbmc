#!/bin/bash

echo
echo "patch.sh"
pwd
echo
echo "/xbmc/input/linux/LinuxInputDevices.cpp wird gepatcht!"
#cp ./patches/xbmc-bp-patch1.patch ../
patch -p1 < xbmc-bp-patch1.patch
#rm ../xbmc-bp-patch1.patch

echo
echo "/xbmc/input/MouseStat.cpp wird gepatcht!"
#cp ./patches/xbmc-bp-patch2.patch ../
patch -p1 < xbmc-bp-patch2.patch
#rm ../xbmc-bp-patch2.patch

echo
echo "xbmc/interfaces/legacy/ModuleXbmcgui.cpp wird gepatcht!"
#cp ./patches/xbmc-bp-patch3.patch ../
patch -p1 < xbmc-bp-patch3.patch
#rm ../xbmc-bp-patch3.patch

echo
echo "/xbmc/input/MouseStat.h wird gepatcht!"
#cp ./patches/xbmc-bp-patch4.patch ../
patch -p1 < xbmc-bp-patch4.patch
#rm ../xbmc-bp-patch4.patch

echo
echo "/xbmc/interfaces/legacy/ModuleXbmcgui.h wird gepatcht!"
#cp ./patches/xbmc-bp-patch5.patch ../
patch -p1 < xbmc-bp-patch5.patch
#rm ../xbmc-bp-patch5.patch
