#!/bin/bash

find -name "*.svg" -o -name "*.SVG" | while read i;
do 
	echo "This $i file will updated the blue"
	fname=$( basename "$i")
#	echo "has the name: $fname"
	fdir=$( dirname "$i")
#	echo "and is in the directory: ${fdir##*/}"
	#inkscape -f "$i" -e "${i%.*}.png"
	sed -i -e 's/#4d82b8/#3daee9/g' "$i"
    sed -i -e 's/#808080/#232629/g' "$i"
    sed -i -e 's/#e68497/#da4453/g' "$i"
    sed -i -e 's/#4d82b8/#1d99f3/g' "$i"
    sed -i -e 's/#eac282/#f47750/g' "$i"
    sed -i -e 's/#696969/#232629/g' "$i"
    sed -i -e 's/#3daee9/#b3b3b3/g' "$i"
    sed -i -e 's/#76a797/#04896a/g' "$i"
 	#convert "$i" -quality 75 "$i"
done
