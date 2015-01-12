#!/bin/bash

# Add touchscreen calibration files
if [ -d /touch ]
	then
		echo "/touch ist schon vorhanden"
	else
		echo "Kalibrierdateien erstellen"
		mkdir /touch
		chmod 666 /touch -R
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

