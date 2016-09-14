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

