#!/bin/bash

# Add touchscreen calibration files
if [ -d /touch ]
	then
		echo "/touch ist schon vorhanden"
	else
		echo "Kalibrierdateien erstellen"
		mkdir /touch
		chmod 777 /touch -R
		touch /touch/touchscreen_axis_calib
		chmod 777 /touch/touchscreen_axis_calib
		echo "calib_x_d=-21;calib_x_fact=0.658097686;calib_y_d=-50;calib_y_fact=0.408626561;swap_axes=0;click_confines=15" > /touch/touchscreen_axis_calib
fi



#copy patch files and apply patches - then remove them
INSTALLDIR=$(pwd)
cd ..
XBMCDIR=$(pwd)

cd $INSTALLDIR/patches
for file in *.patch
	do	
		cp $INSTALLDIR/patches/"$file" $XBMCDIR
		echo "Apply patchfile"
		cd $XBMCDIR
		patch -p1 --ignore-whitespace < $file
		echo "Remove patchfile!"
		rm $XBMCDIR/"$file"
		echo 
done

