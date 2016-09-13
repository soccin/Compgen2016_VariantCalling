#!/bin/bash

if [ "$#" == "0" ]; then
	echo "missing FILE argument"
	echo "usage: scanPaths.sh FILE_OF_FILES"
	exit
fi

FILE_OF_FILES=$1

for file in $(cat $FILE_OF_FILES); do
	filePath=$(which $file)
	if [ "$filePath" != "" ]; then
		echo "$file is in $filePath"
	else 
		echo "$file is NOT ON PATH!"
	fi
done
