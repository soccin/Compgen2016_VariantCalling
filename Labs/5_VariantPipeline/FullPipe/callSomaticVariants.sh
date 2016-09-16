#!/bin/bash

# Call Somatic Variants
# Teaching Pipeline for Compgen2016 - MDC-Berlin
# N. D. Socci (soccin@mskcc.org)
# 2016.09.15

# Get current directory of script
SDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

source $SDIR/scripts/config.sh

if [ "$#" != "3" ]; then
	echo
	echo "usage: callSomaticVariants.sh PatientID TUMOR_R1_.fastq.gz NORMAL_R1_.fastq.gz"
	echo
	exit
fi

PATIENTID=$1

#
# WARING: 
# This script assumes that the R1,R2 reads are named with the 
# Casava convention (XXX_R1_,XXX_R2_)
#   !!! AND !!!
# That the string _R1_ does not appear in the prefix (XXX)
# If either of these are false then the behavior is
# undefined and will like crash
# Some checking is done but it may not handle all edge cases

TUMOR_R1=$2
TUMOR_R2=${TUMOR_R1/_R1_/_R2_}
NORMAL_R1=$3
NORMAL_R2=${NORMAL_R1/_R1_/_R2_}

if [ ! -e $TUMOR_R2 ]; then
	echo "Read pair 2 for Tumor does not exist"
	echo TUMOR_R2=$TUMOR_R2
	exit
fi

if [ ! -e $NORMAL_R2 ]; then
	echo "Read pair 2 for Normal does not exist"
	echo NORMAL_R2=$NORMAL_R2
	exit
fi

#
# Create a date/time stamped OUTPUT directory
# 

ODIR=out/${PATIENTID}/$(date +%Y%m%d_%H%M%S)

if [ -e $ODIR ]; then
	echo "Output directory [$ODIR] already exists"
	echo "will not overwrite"
	exit
fi

mkdir -p $ODIR

echo "Output directory is [$ODIR]"

#
# Phase I
#    Clip
#    Map
#    RG+Sort
#    MarkDups
#

echo "Processing Tumor"
mkdir -p $ODIR/Tumor
$SDIR/scripts/clipMapMarkDups.sh $ODIR/Tumor $GENOME_BWA \
	${PATIENTID}_T $TUMOR_R1 $TUMOR_R2

echo "Processing Normal"
mkdir -p $ODIR/Normal
$SDIR/scripts/clipMapMarkDups.sh $ODIR/Normal $GENOME_BWA \
	${PATIENTID}_N $NORMAL_R1 $NORMAL_R2

echo "done with mapping stage"

#
# Phase II
#     GATK Indel-Realign
#     GATK BaseQ Recal
#

# gatkBAMPostProcess $ODIR/gatk $ODIR/Tumor/md.bam $ODIR/Normal/md.bam

#
# Phase III
#     Variant Calling (mutect)
#

echo "calling variants"

mkdir $ODIR/variants
$SDIR/scripts/callVariants.sh $ODIR/variants $ODIR/Tumor/md.bam $ODIR/Normal/md.bam

mkdir $ODIR/annote
echo "done with calling...annotating"
$SDIR/scripts/annotateVariants.sh $ODIR/annote $ODIR/variants/mutect.vcf

