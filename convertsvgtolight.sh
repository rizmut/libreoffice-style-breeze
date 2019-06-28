#!/bin/bash
# Bilder in jpg convertieren

cp "images_breeze_svg" \
   "images_breeze_dark_svg"
cd "images_breeze_dark_svg"   

find -name "*.svg" -o -name "*.SVG" | while read i;
do 
	echo "This $i file will be Light Theme"
	fname=$( basename "$i")
#	echo "has the name: $fname"
	fdir=$( dirname "$i")
#	echo "and is in the directory: ${fdir##*/}"
	#inkscape -f "$i" -e "${i%.*}.png"
	sed -i -e 's/#f2f2f2/#4d4d4d/g' "$i"
	#convert "$i" -quality 75 "$i"
done 
