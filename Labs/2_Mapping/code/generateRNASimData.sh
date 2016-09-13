#!/bin/bash

ROOT45=/share/data/compgen2016/day45_Intro2Seq_VarCalling
GENOME=$ROOT45/genomes/H.Sapiens/b37_hl/gtf/gencode.v18.annotation.gtf.dedup.highlight.fasta

wgsim -e 0.001 -N 500000 -1 75 -2 75 \
	$GENOME \
	ra1 ra2

wgsim -e 0.001 -N 100000 -1 75 -2 75 \
	./onco.fa \
	rb1 rb2

cat ra1 rb1	> gencodeTest2_Q30_1_R1.fastq
cat ra2 rb2 > gencodeTest2_Q30_1_R2.fastq

gzip -9 gencode* 
rm ra* rb*
