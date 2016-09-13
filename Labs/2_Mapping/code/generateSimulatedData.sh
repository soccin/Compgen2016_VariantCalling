#!/bin/bash

wgsim -N 100000 -1 50 -2 50 $GENOME \
	b37Test2_DEF_1_SE.fastq /dev/null

wgsim -N 100000 -1 50 -2 50 $GENOME \
	b37Test2_DEF_2_R1.fastq \
	b37Test2_DEF_2_R2.fastq

gzip -9 b37Test2_DEF_*