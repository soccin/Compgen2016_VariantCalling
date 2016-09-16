#!/bin/bash

SDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SDIR/config.sh

if [ "$#" != "2" ]; then
	echo "usage: annotateVariants.sh ODIR VCF"
	exit
fi

ODIR=$1
INPUT_VCF=$2

