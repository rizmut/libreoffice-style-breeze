# libreoffice-style-breeze
Breeze Icons for LibreOffice

<p align="center">
  <img src="https://github.com/rizmut/libreoffice-style-breeze/raw/master/libreoffice-style-breeze.png" alt="preview"/>
</p>

**NOTE:** Go to _Tools_ → _Options_ → _LibreOffice_ → _View_ to enable the theme.
This icon theme is taken from LibreOffice core.

This repository is used as a backup as well as a source of checks for the most up-to-date themes. Changes made very gradually, and when changes are felt good, they will be sent to LibreOffice core.
# System Wide Installation
## For *NIX Family 

Use the script to install the latest version directly from this repo (independently on your distro):
```
curl -s https://raw.githubusercontent.com/rizmut/libreoffice-style-breeze/master/install-breeze.sh | sh
```
Otherwise, if you have cloned this repo, just use local installer script (don't forget to change /path/to to your real path directory to the repo):

```
cd /path/to/libreoffice-style-breeze && sh install-breeze-local.sh
```
### Remove
```
curl -s https://raw.githubusercontent.com/rizmut/libreoffice-style-breeze/master/remove-breeze.sh | sh
```

## For Microsoft Windows 

Simply download zipped archive from build directory and copy (with administrator priviledges) to ```C:\Program Files\LibreOffice-<version-here>\config\share```

```
https://raw.githubusercontent.com/rizmut/libreoffice-style-breeze/master/build/images_breeze.zip
https://raw.githubusercontent.com/rizmut/libreoffice-style-breeze/master/build/images_breeze_dark.zip
https://raw.githubusercontent.com/rizmut/libreoffice-style-breeze/master/build/images_breeze_dark_svg.zip
https://raw.githubusercontent.com/rizmut/libreoffice-style-breeze/master/build/images_breeze_svg.zip

```


# Extension Based Installation

Since LibreOffice 6.0 there is support for installing icon set as an extension, simply download the extension from following link and open it with LibreOffice or, open __Tools__ → __Extension Manager__ ... click __Add__ and browse for local directory where the extension placed

```
https://raw.githubusercontent.com/rizmut/libreoffice-style-breeze/master/build/breeze-Dark-IconSet.oxt
https://raw.githubusercontent.com/rizmut/libreoffice-style-breeze/master/build/breeze-Dark-SVGIconSet.oxt
https://raw.githubusercontent.com/rizmut/libreoffice-style-breeze/master/build/breeze-IconSet.oxt
https://raw.githubusercontent.com/rizmut/libreoffice-style-breeze/master/build/breeze-SVG-IconSet.oxt

```

