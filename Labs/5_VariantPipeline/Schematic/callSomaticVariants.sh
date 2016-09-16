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
# Phase I
#    Clip
#    Map
#    RG+Sort
#    MarkDups
#


# # SKIP on first pass
# Phase II
#     GATK Indel-Realign
#     GATK BaseQ Recal
#

#
# Phase III
#     Variant Calling (mutect)
#

#
# Phase IV
#
# 	  Annotate Variants
#



