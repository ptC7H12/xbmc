#!/bin/bash

echo "Ordner und Dateien erstellen"
mkdir /touch
chmod 777 /touch -R
touch /touch/touchscreen_axis_calib
chmod 777 /touch/touchscreen_axis_calib
echo "calib_x_d=-21;calib_x_fact=0.658097686;calib_y_d=-50;calib_y_fact=0.408626561;swap_axes=0;click_confines=15" > /touch/touchscreen_axis_calib

echo 
echo "/xbmc/input/linux/LinuxInputDevices.cpp wird gepatcht!"
cp ./patches/xbmc-bp-patch1.patch ../
patch -p1 < ../xbmc-bp-patch1.patch
rm ../xbmc-bp-patch1.patch

echo 
echo "/xbmc/input/MouseStat.cpp wird gepatcht!"
cp ./patches/xbmc-bp-patch2.patch ../
patch -p1 < ../../xbmc-bp-patch2.patch
rm ../../xbmc-bp-patch2.patch

echo 
echo "xbmc/interfaces/legacy/ModuleXbmcgui.cpp wird gepatcht!"
cp ./patches/xbmc-bp-patch3.patch ../
patch -p1 < ../xbmc-bp-patch3.patch
rm ../xbmc-bp-patch3.patch

echo 
echo "/xbmc/input/MouseStat.h wird gepatcht!"
cp ./patches/xbmc-bp-patch4.patch ../
patch -p1 < ../xbmc-bp-patch4.patch
rm ../xbmc-bp-patch4.patch

echo 
echo "/xbmc/interfaces/legacy/ModuleXbmcgui.h wird gepatcht!"
cp ./patches/xbmc-bp-patch5.patch ../
patch -p1 < ../xbmc-bp-patch5.patch
rm ../xbmc-bp-patch5.patch