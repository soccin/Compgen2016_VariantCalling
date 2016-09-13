#!/bin/bash

ROOT45=/share/data/compgen2016/day45_Intro2Seq_VarCalling
GENOME=$ROOT45/genomes/H.Sapiens/b37_hl/gtf/gencode.v18.annotation.gtf.dedup.highlight.fasta

wgsim -e 0.001 -N 1000000 -1 50 -2 50 \
	$GENOME \
	gencodeTest2_Q30_1_R1.fastq \
	gencodeTest2_Q30_1_R2.fastq

gzip -9 gencode* 

