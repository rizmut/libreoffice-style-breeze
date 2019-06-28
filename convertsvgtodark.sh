#!/bin/bash
# Bilder in jpg convertieren

cp -Rf "images_breeze_svg" \
   "images_breeze_dark_svg"
cd "images_breeze_dark_svg"   

find -name "*.svg" -o -name "*.SVG" | while read i;
do 
	echo "This $i file will be Dark Theme"
	fname=$( basename "$i")
#	echo "has the name: $fname"
	fdir=$( dirname "$i")
#	echo "and is in the directory: ${fdir##*/}"
	#inkscape -f "$i" -e "${i%.*}.png"
	sed -i -e 's/#4d4d4d/#f2f2f2/g' "$i"
	#convert "$i" -quality 75 "$i"
done 

echo "=> Export dark SVG to PNG ..."
find -name "*.svg" -o -name "*.SVG" | while read i;
do 
	echo "This $i file is compressed"
	fname=$( basename "$i")
#	echo "has the name: $fname"
	fdir=$( dirname "$i")
#	echo "and is in the directory: ${fdir##*/}"
	inkscape -f "$i" -e "${i%.*}.png"
	optipng -o7 "${i%.*}.png"
	#convert "$i" -quality 75 "$i"
done 

echo "=> Delete dark SVG files ..."
find -name "*.svg" -o -name "*.SVG" | while read i;
do
    fname=$( basename "$i")
    fdir=$( dirname "$i")
    rm "$i"
done

echo "=> Delete old dark PNG directory ..."

cd "./.."
rm -Rf "./images_breeze_dark"
mv "images_breeze_dark_svg" \
  "images_breeze_dark"
