#!/bin/bash

#Patches provided by jogi36de [lemaker.org forum]

#copy patch files and apply patches - then remove them
INSTALLDIR=$(pwd)
cd ..
XBMCDIR=$(pwd)

cd $INSTALLDIR/patches/lubuntu
for file in *.patch
	do	
		cp $INSTALLDIR/patches/lubuntu/"$file" $XBMCDIR
		echo "Apply patchfile"
		cd $XBMCDIR
		patch -p1 --ignore-whitespace < $file
		echo "Remove patchfile!"
		rm $XBMCDIR/"$file"
		echo
done
