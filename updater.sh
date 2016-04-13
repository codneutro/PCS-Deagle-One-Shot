#!/bin/bash
git clone https://github.com/codneutro/PCS-Deagle-One-Shot tmp
cd tmp
cp -r * ..
rm -rf ../tmp
rm -f ../README.md
rm -f ../LICENSE