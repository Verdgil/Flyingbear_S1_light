#!/bin/sh

dpkg-deb -R ./update_ae27075_orig.mksp ./unpacked

cat ./light.sh >> ./unpacked/DEBIAN/postinst

dpkg-deb -b ./unpacked update_ae27075.mksp

# rm -rf unpacked

