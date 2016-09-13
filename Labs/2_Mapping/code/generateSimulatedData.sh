#!/bin/bash

ROOT45=/share/data/compgen2016/day45_Intro2Seq_VarCalling
GENOME=$ROOT45/genomes/H.Sapiens/b37_hl/b37_hl.fa

wgsim -N 100000 -1 50 -2 50 $GENOME \
	b37Test2_DEF_1_SE.fastq /dev/null

wgsim -N 100000 -1 50 -2 50 $GENOME \
	b37Test2_DEF_2_R1.fastq \
	b37Test2_DEF_2_R2.fastq

gzip -9 b37Test2_DEF_*