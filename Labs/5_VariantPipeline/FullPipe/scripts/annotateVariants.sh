#!/bin/bash

SDIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
source $SDIR/config.sh

if [ "$#" != "2" ]; then
	echo "usage: annotateVariants.sh ODIR VCF"
	exit
fi

ODIR=$1
INPUT_VCF=$2

$JAVA8 -jar $SNPEFF \
	eff \
	-o gatk \
	-canon GRCh37.75 \
	-s $ODIR/snpEff_summary.html \
	-csvStats $ODIR/snpEff_ \
	$INPUT_VCF >$ODIR/snpeff.vcf \
	| tee $ODIR/log.snpeff \
	2> $ODIR/elog.snpeff

$JAVA8 -jar $GATK \
	-T VariantAnnotator \
	-R $GENOME_FASTA \
	-A SnpEff \
	--variant $INPUT_VCF \
	--snpEffFile $ODIR/snpeff.vcf \
	-o $ODIR/annote.vcf \
	| tee $ODIR/log.gatk.varAnnote \
	2> $ODIR/elog.gatk.varAnnote

egrep "^#" $ODIR/annote.vcf > $ODIR/annoteFiltered.vcf
egrep -v "^#" $ODIR/annote.vcf \
	| awk -F"\t" '$7!="REJECT"{print $0}' \
	>> $ODIR/annoteFiltered.vcf

$JAVA8 -jar $GATK \
	-T VariantsToTable -R $GENOME_FASTA \
	-V $ODIR/annoteFiltered.vcf \
	--allowMissingData \
	$(cat $SDIR/data/snpEffCols | awk '{print "-F",$1}') \
	-GF GT -GF DP -GF AD \
	-o $ODIR/annoteFiltered.txt \
	| tee $ODIR/log.gatk.varToTable \
	2> $ODIR/log.gatk.varToTable
