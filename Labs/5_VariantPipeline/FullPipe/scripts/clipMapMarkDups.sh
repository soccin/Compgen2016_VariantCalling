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

mkdir -p $ODIR

echo "clipping $(basename $FASTQ_R1)"
cutadapt -q 5 -a ADAPTER_R1 -A ADAPTER_R2 \
	--minimum-length 35 \
	-o $ODIR/R1.fastq \
	-p $ODIR/R2.fastq \
	$FASTQ_R1 $FASTQ_R2 \
	| tee $ODIR/log.cutadapt 2>$ODIR/elog.cutadapt

echo
echo

##################################################################
# Mapping with BWA MEM
#

echo "mapping $(basename $FASTQ_R1)"
bwa mem $GENOME_BWA $ODIR/R1.fastq $ODIR/R2.fastq >$ODIR/bwa.sam 2>$ODIR/log.bwa


##################################################################
# PICARD Post
#
#  - AddOrReplaceReadGroups (which also Sorts and makes index)
#  - MarkDuplicatesWithMateCigar (newer [better] version)
#

$JAVA8 -Xmx$VMSIZE -jar $PICARD \
	AddOrReplaceReadGroups \
	SO=coordinate \
	CREATE_INDEX=true \
	LB=$SAMPLEID \
	PL=illumina \
	PU=$SAMPLE_$(basename $FASTQ_R1 | sed 's/_R1_.*//') \
	SM=$SAMPLEID \
	I=$ODIR/bwa.sam \
	O=$ODIR/sort.bam \
	| tee $ODIR/log.picard.addRg \
	2> $ODIR/elog.picard.addRg

$JAVA8 -Xmx$VMSIZE -jar $PICARD \
	MarkDuplicatesWithMateCigar \
	I=$ODIR/sort.bam \
	O=$ODIR/md.bam \
	M=$ODIR/md.txt \
	CREATE_INDEX=true \
	| tee $ODIR/log.picard.markD \
	2> $ODIR/elog.picard.markD
