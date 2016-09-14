# Compgen2016 Day 4,5 configuration file

# Path to root of lab data directories

ROOT45=/share/data/compgen2016/day45_Intro2Seq_VarCalling

# Put our code directory on our PATH

if [[ ! $PATH =~ Day45/code ]]; then
	PATH=~/Day45/code:$PATH
	export PATH
fi

# JARS 

UNAME=$(uname)

if [ "$UNAME" == "Darwin" ]; then

	# This is my mac

	JARDIR=/Users/socci/Desktop/Compgen2016/Work/jars
	PICARD=$JARDIR/picard.jar
	GATK=$JARDIR/GenomeAnalysisTK.jar
	MUTECT=$JARDIR/mutect-1.1.7.jar
	SNPEFF=$JARDIR/snpEff.jar

else

	# Course laptop

	PICARD=/usr/local/picard/build/libs/picard.jar
	GATK=/usr/local/GATK/GenomeAnalysisTK.jar
	MUTECT=/usr/local/mutect/mutect-1.1.7.jar
	SNPEFF=/usr/local/snpEff/snpEff.jar

fi

# Genome files

GENOME_BUILD=human_b37
GENOME_ROOT=$ROOT45/genomes/H.Sapiens/b37_hl
GENOME_FASTA=$GENOME_ROOT/b37_hl.fa
GENOME_DICT=$GENOME_ROOT/b37_hl.dict
GENOME_BWA=$GENOME_ROOT/index/bwa/b37_hl.fa

# Note for STAR you need to pick
#    NoGTF
#    Gencode_75
GENOME_STAR=$GENOME_ROOT/index/star

