#!/bin/bash

SDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SDIR/config.sh

if [ "$#" != "3" ]; then
	echo "usage: callVariants.sh ODIR TUMOR_BAM NORMAL_BAM"
	exit
fi

