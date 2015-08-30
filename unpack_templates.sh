#!/bin/bash

# Zotero.dotm
rm -rf src/Zotero.dotm/*

# Other than vbaProject.bin, all files are XML
unzip install/Zotero.dotm -d src/Zotero.dotm/

rm src/Zotero.dotm/word/vbaProject.bin
mkdir src/Zotero.dotm/word/vbaProject.bin
python tools/officeparser/officeparser.py -l ERROR -o src/Zotero.dotm/word/vbaProject.bin --extract-streams --extract-macros --extract-unknown-sectors install/Zotero.dotm

# Zotero.dot (not unzipping, because all files are binary anyway)
rm -rf src/Zotero.dot/*

python tools/officeparser/officeparser.py -l ERROR -o src/Zotero.dot --extract-streams --extract-macros --extract-unknown-sectors install/Zotero.dot