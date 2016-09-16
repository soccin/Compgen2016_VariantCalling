#!/bin/bash

SDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SDIR/config.sh

if [ "$#" != "3" ]; then
	echo "usage: callVariants.sh ODIR TUMOR_BAM NORMAL_BAM"
	exit
fi

ODIR=$1
TUMOR=$2
NORMAL=$3

$JAVA7 -Xmx$VMSIZE -jar $MUTECT \
	-T MuTect -R $GENOME_FASTA \
	-dcov 50000 \
	-I:tumor $TUMOR \
	-I:normal $NORMAL \
	-o $ODIR/mutect.txt \
	-vcf $ODIR/mutect.vcf \
	| tee $ODIR/log.mutect \
	2> $ODIR/elog.MuTect
