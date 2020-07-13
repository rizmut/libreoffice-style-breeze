#!/bin/bash
#2020 by Rizal Muttaqin

links_light="breeze_svg/links.txt"
links_dark="breeze_dark_svg/links.txt"

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

rm -Rf "breeze"
rm -Rf "breeze_dark"
rm -Rf "breeze_dark_svg"

cd "breeze_svg"

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

cp -Rf "breeze_svg" \
   "breeze"
cd "breeze"

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

cp -Rf "breeze_svg" \
   "breeze_dark_svg"

cd "breeze_dark_svg"   

find -name "*.svg" -o -name "*.SVG" | while read i;
do 
	echo "This $i file will be Dark Theme"
	fname=$( basename "$i")
#	echo "has the name: $fname"
	fdir=$( dirname "$i")
#	echo "and is in the directory: ${fdir##*/}"
	#inkscape -f "$i" -e "${i%.*}.png"
	sed -i -e 's/#232629/#eff0f1/g' "$i"
	sed -i -e 's/#fff/#000/g' "$i"
	sed -i -e 's/#000/#fff/g' "$i"
	#convert "$i" -quality 75 "$i"
done 

echo "=> 3. Breeze PNG (dark) version"
cd "./.."

cp -Rf "breeze_dark_svg" \
   "breeze_dark"
cp "breeze/links.txt" \
   "breeze_dark"   
cd "breeze_dark" 

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

cd "./.."
echo "delete links.txt in SVG directories"

if [ -f $links_light ] ; then
    rm $links_light
fi

if [ -f $links_dark ] ; then
    rm $links_dark
fi
