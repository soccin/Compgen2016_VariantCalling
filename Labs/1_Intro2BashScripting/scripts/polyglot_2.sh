#!/bin/bash

if [ "$#" == "0" ]; then
	echo "Need to set at least one LOCALE on command line"
fi

for LOCALE in $*; do

	if [ "$LOCALE" == "de" ]; then
		GREETING="Hallo Welt."
	elif [ "$LOCALE" == "it" ]; then
		GREETING="Ciao Mondo."
	elif [ "$LOCALE" == "en" ]; then
		GREETING="Hello World"
	else
		echo "ERROR: Unknown LOCALE==$LOCALE"
		exit 1
	fi

	echo $GREETING

done

