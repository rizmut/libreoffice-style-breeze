#!/bin/bash

if ! command -v optipng >/dev/null
then
    echo "Please install optipng"
    exit 1
fi

if ! command -v svgcleaner >/dev/null
then
    echo "Please install svgcleaner"
    exit 1
fi

echo "=> Remove old PNG both light and dark version"
cp "images_breeze/links.txt" \
   "images_breeze_svg"
rm -Rf "images_breeze"
rm -Rf "images_breeze_dark"

cd "images_breeze_svg"

echo "=> Clean SVG files ..."
find -name "*.svg" -o -name "*.SVG" | while read i;
do 
	echo "This $i file is compressed"
	fname=$( basename "$i")
#	echo "has the name: $fname"
	fdir=$( dirname "$i")
#	echo "and is in the directory: ${fdir##*/}"
	svgcleaner "$i" "${i%.*}.svg"
done

cd "./.."

cp -Rf "images_breeze_svg" \
   "images_breeze"
rm "images_breeze_svg/links.txt"
cd "images_breeze"

echo "=> 1. Breeze PNG (light) version"
echo "=> Export light SVG to PNG ..."
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

echo "=> Delete light SVG files ..."
find -name "*.svg" -o -name "*.SVG" | while read i;
do
    fname=$( basename "$i")
    fdir=$( dirname "$i")
    rm "$i"
done

echo "=> 2. Breeze SVG (dark) version"
cd "./.."

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
	sed -i -e 's/#232629/#eff0f1/g' "$i"
	#convert "$i" -quality 75 "$i"
done 

echo "=> 3. Breeze PNG (dark) version"
cd "./.."

cp -Rf "images_breeze_dark_svg" \
   "images_breeze_dark"
cd "images_breeze_dark" 

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
