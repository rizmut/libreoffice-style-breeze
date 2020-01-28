#!/bin/bash
#2020 by Rizal Muttaqin

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

echo "=> Remove old both light and dark version"

rm -Rf "images_breeze_dark"

cp "images_breeze_dark/links.txt" \
   "images_breeze_dark_svg"

cd "images_breeze_dark_svg"

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

cp -Rf "images_breeze_dark_svg" \
   "images_breeze_dark"
rm "images_breeze_dark_svg/links.txt"
cd "images_breeze_dark"

echo "=> 1. Breeze PNG (dark) version"
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
