#!/bin/bash
tmpdate=`date +%s`
echo
echo "Getting latest wordpress source code ..."
echo
curl "https://wordpress.org/latest.zip" -o /tmp/latest-${tmpdate}.zip &&
echo
echo "Installing source on template ..."
unzip -q /tmp/latest-${tmpdate}.zip -d src &&
mv src/wordpress/* src/ &&
echo 
echo "Done!"

