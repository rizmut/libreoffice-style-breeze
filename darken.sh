#!/bin/bash

find -name "*.svg" -o -name "*.SVG" | while read i;
do
	echo "This $i file will be Dark Theme"
	fname=$( basename "$i")
#	echo "has the name: $fname"
	fdir=$( dirname "$i")
#	echo "and is in the directory: ${fdir##*/}"
	#inkscape -f "$i" -e "${i%.*}.png"
	sed -i -e 's/#232629/#eff0f1/g' "$i"
	#convert "$i" -quality 75 "$i"
done
