#!/bin/bash

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


		chmod a+x patch.sh

		echo "install-patch.sh"
		pwd
		echo

		cp patch.sh ../
		cp patches/xbmc-bp-patch1.patch ../
		cp patches/xbmc-bp-patch2.patch ../
		cp patches/xbmc-bp-patch3.patch ../
		cp patches/xbmc-bp-patch4.patch ../
		cp patches/xbmc-bp-patch5.patch ../


