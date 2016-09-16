#!/bin/bash

SDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SDIR/config.sh

if [ "$#" != "5" ]; then
	echo "usage: clipMapMarkDups.sh OUTDIR GENOME_INDEX SAMPLEID R1 R2"
	exit
fi

ODIR=$1
GENOME_BWA=$2
SAMPLEID=$3
FASTQ_R1=$4
FASTQ_R2=$5

echo GENOME_BWA=$GENOME_BWA
echo FASTQ_R1=$FASTQ_R1

##################################################################
# cutadapt PE Mode
# Quality trimming
# The -q (or --trim-qualities) parameter can be used to 
# trim low-quality ends from reads before adapter removal. 
# For this to work correctly, the quality values must be 
# encoded as ascii(phred quality + 33). If they are encoded 
# as ascii(phred quality + 64), you need to add --quality-base=64 
# to the command line.
#
# Need to set a min length PICARD does not like empty reads; which
# BWA is happy to map
#

