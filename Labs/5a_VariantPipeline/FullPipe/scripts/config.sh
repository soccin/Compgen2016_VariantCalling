# Compgen2016 Day 4,5 configuration file

# Path to root of lab data directories

ROOT45=/share/data/compgen2016/day45_Intro2Seq_VarCalling

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

# JARS 

UNAME=$(uname)

if [ "$UNAME" == "Darwin" ]; then

        # This is my mac

        JARDIR=/Users/socci/Desktop/Compgen2016/Work/jars
        PICARD=$JARDIR/picard.jar
        GATK=$JARDIR/GenomeAnalysisTK.jar
        MUTECT=$JARDIR/mutect-1.1.7.jar
        SNPEFF=$JARDIR/snpEff.jar
        JAVA7=/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home/bin/java
        JAVA8=/Library/Java/JavaVirtualMachines/jdk1.8.0_102.jdk/Contents/Home/bin/java

else

        # Course laptop

        PICARD=/usr/local/picard/build/libs/picard.jar
        GATK=/usr/local/GATK/GenomeAnalysisTK.jar
        MUTECT=/usr/local/mutect/mutect-1.1.7.jar
        SNPEFF=/usr/local/snpEff/snpEff.jar
        JAVA7= #Needed for mutect
        JAVA8= #Default JAVA
fi

VMSIZE=4g

### Illumina TrueSeq adapters
## R1
# Maximal common  AGATCGGAAGAGC
# S1Seq           AGATCGGAAGAGC ACACGTCT GAAGTCCAGTCAC
# BIC Var         AGATCGGAAGAGC ACACGTCT
# Full (bc1)      AGATCGGAAGAGC ACACGTCT GAACTCCAGTCAC ATCACGATCTCGTATGCCGTCTTCTGCTTG
# 6bp BC                                               <-BC->
# 8bp BC                                               <--BC-->

## R2
# Maximal common  AGATCGGAAGAGC
# S1Seq           AGATCGGAAGAGC GTCGTGTA GGGAAAGAGTGTA
# BIC Var         AGATCGGAAGAGC GTCGTGTA
# DMP             AGATCGGAAGAGC GTCGTGTA GGGAAAGAGTGTA GATCTCGGTGGTCGCCGTATCATT

ADAPTER_R1=AGATCGGAAGAGCACACGTCTGAAGTCCAGTCAC
ADAPTER_R2=AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTGTA

