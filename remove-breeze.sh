#!/bin/sh

set -e

gh_repo="libreoffice-style-breeze"
gh_desc="Breeze LibreOffice icon themes"

cat <<- EOF

  $gh_desc
  https://github.com/rizmut/$gh_repo
  
  
EOF

echo "=> Removing $gh_desc ..."
for dir in \
  /usr/share/libreoffice/share/config \
  /usr/lib/libreoffice/share/config \
  /usr/lib64/libreoffice/share/config \
  /usr/local/lib/libreoffice/share/config \
  /opt/libreoffice*/share/config; do
  [ -d "$dir" ] || continue
  sudo rm -f "$dir/images_breeze.zip"
  sudo rm -f "$dir/images_breeze_svg.zip"
  sudo rm -f "$dir/images_breeze_dark.zip"
  sudo rm -f "$dir/images_breeze_dark_svg.zip"
done
echo "=> Done!"
