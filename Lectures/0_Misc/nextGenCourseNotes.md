Materials

http://www.ebi.ac.uk/training/online/course/ebi-next-generation-sequencing-practical-course
http://fg.cns.utexas.edu/fg/course_materials.html
http://informaticstraining.hms.harvard.edu/ngs
http://ged.msu.edu/angus/
https://wikis.utexas.edu/display/bioiteam/SSC+Intro+to+NGS+Bioinformatics+Course
https://wiki.uchicago.edu/pages/viewpage.action?pageId=95855827


Outline

Open bioinformatcs; advertisement

Introduction to sequencing technologies

* How Illumina, Ion Torrent and Ion Proton, 454, SOLiD
* Their strengths and weaknesses

Applications of NGS

Overview of library prep for WGS, WES and RNAseq

Quality Control (Manipulating FASTA files)

* FastQC
* FASTX

Pre-alignment Processing

* Clipping/Trimming

Read Generation

* wgsim (https://github.com/lh3/wgsim.git)

* Caution about using this to compare performance; often not like real data

Genomes

* UCSC

* NCBI / Ensembl

* chromosome/naming convention (WTF)

* iGenome (https://support.illumina.com/sequencing/sequencing_software/igenome.html)

** Annotation

Sequencing alignment (Aligning Fasta files)

* How to choose aligners
* BLAST
* BLAT
* Short-read aligners (bwa and shrimp)
	* Indexes; changes in format bwa version; 32 vs 64bit
* Long-read aligner (bwa-sw or equivalent)
* RNA aligner (tophat plus another one)

Cite mapping comp paper. 

Data manipulation and visualization tools (Analyzing Alignments)

* Samtools
* Bedtools
* IGV

Picard and GATK v2 (Processing Alignments)

* Alignment and target capture stats
* PCR duplicate removal
* Local realignment
* Quality score recalibration

SNV and indel calling

* GATK UG
* Somatic sniper
* Pindel or equivalent

Fusion transcript

* deFuse
* Tophat-fusion

Genomic structural variants

* SVDetect or equivalent

Copy number from WGS and WES
Expression profiling
Alternative splicing

Annotation

* snpEff or equivalent

MISC

Circos



