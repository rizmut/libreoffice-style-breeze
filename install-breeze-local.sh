#!/bin/sh

set -e

gh_repo="libreoffice-style-breeze"
gh_desc="Breeze LibreOffice icon themes"

cat <<- EOF

  $gh_desc
  https://github.com/rizmut/$gh_repo
  
  
EOF

temp_dir="$(mktemp -d)"

# Breeze
cd "images_breeze"
cp "links.txt" \
   "../images_breeze_dark"
zip -r -D images_breeze.zip *
mv "images_breeze.zip" \
  "./../build/"
cd "./../build/"
echo "=> Deleting old $gh_desc extension file ..."
rm -f "Breeze-IconSet.oxt"
echo "=> Create new $gh_desc extension one ..."
cp "images_breeze.zip" \
   "Breeze-IconSet/iconsets"
cd "./Breeze-IconSet"
zip -r -D Breeze-IconSet.oxt *
mv "Breeze-IconSet.oxt" \
   "./.."
cd "./../.."

# Breeze Dark
cd "images_breeze_dark"
zip -r -D images_breeze_dark.zip *
mv "images_breeze_dark.zip" \
  "./../build/"
cd "./../build/"
echo "=> Deleting old $gh_desc extension file (dark) ..."
rm -f "Breeze-Dark-IconSet.oxt"
echo "=> Create new $gh_desc extension one (dark) ..."
cp "images_breeze_dark.zip" \
   "Breeze-Dark-IconSet/iconsets"
cd "./Breeze-Dark-IconSet"
zip -r -D Breeze-Dark-IconSet.oxt *
mv "Breeze-Dark-IconSet.oxt" \
   "./.."
cd "./../.."

# Breeze SVG
cd "images_breeze_svg"
zip -r -D images_breeze_svg.zip *
mv "images_breeze_svg.zip" \
  "./../build/"
cd "./../build/"
echo "=> Deleting old $gh_desc extension file (SVG) ..."
rm -f "Breeze-SVG-IconSet.oxt"
echo "=> Create new $gh_desc extension one (SVG) ..."
cp "images_breeze_svg.zip" \
   "Breeze-SVG-IconSet/iconsets"
cd "./Breeze-SVG-IconSet"
zip -r -D Breeze-SVG-IconSet.oxt *
mv "Breeze-SVG-IconSet.oxt" \
   "./.."
cd "./../.."

# Breeze Dark SVG
cd "images_breeze_dark_svg"
zip -r -D images_breeze_dark_svg.zip *
mv "images_breeze_dark_svg.zip" \
  "./../build/"
cd "./../build/"
echo "=> Deleting old $gh_desc extension file (dark SVG) ..."
rm -f "Breeze-Dark-SVG-IconSet.oxt"
echo "=> Create new $gh_desc extension one (dark SVG) ..."
cp "images_breeze_dark_svg.zip" \
   "Breeze-Dark-SVG-IconSet/iconsets"
cd "./Breeze-Dark-SVG-IconSet"
zip -r -D Breeze-Dark-SVG-IconSet.oxt *
mv "Breeze-Dark-SVG-IconSet.oxt" \
   "./.."
cd "./../.."

echo "=> Deleting whole old $gh_desc ..."
sudo rm -f "/usr/share/libreoffice/share/config/images_breeze.zip"
sudo rm -f "/usr/share/libreoffice/share/config/images_breeze_dark.zip"
sudo rm -f "/usr/share/libreoffice/share/config/images_breeze_svg.zip"
sudo rm -f "/usr/share/libreoffice/share/config/images_breeze_dark_svg.zip"
echo "=> Installing ..."
sudo mkdir -p "/usr/share/libreoffice/share/config"
sudo cp \
  "build/images_breeze.zip" \
  "/usr/share/libreoffice/share/config"
sudo cp \
  "build/images_breeze_dark.zip" \
  "/usr/share/libreoffice/share/config"
sudo cp \
  "build/images_breeze_svg.zip" \
  "/usr/share/libreoffice/share/config"
sudo cp \
  "build/images_breeze_dark_svg.zip" \
  "/usr/share/libreoffice/share/config"
rm "images_breeze_dark/links.txt"
for dir in \
  /usr/lib64/libreoffice/share/config \
  /usr/lib/libreoffice/share/config \
  /usr/local/lib/libreoffice/share/config \
  /opt/libreoffice*/share/config; do
  [ -d "$dir" ] || continue
  sudo ln -sf "/usr/share/libreoffice/share/config/images_breeze.zip" "$dir"
  sudo ln -sf "/usr/share/libreoffice/share/config/images_breeze_dark.zip" "$dir"
  sudo ln -sf "/usr/share/libreoffice/share/config/images_breeze_svg.zip" "$dir"
  sudo ln -sf "/usr/share/libreoffice/share/config/images_breeze_dark_svg.zip" "$dir"
done
echo "=> Done!"
