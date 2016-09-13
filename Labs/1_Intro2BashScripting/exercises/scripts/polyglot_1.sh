#!/bin/bash

LOCALE=$1
if [ "$LOCALE" == "" ]; then
	GREETING="WARNING: Did you forget to set LOCALE"
elif [ "$LOCALE" == "de" ]; then
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
