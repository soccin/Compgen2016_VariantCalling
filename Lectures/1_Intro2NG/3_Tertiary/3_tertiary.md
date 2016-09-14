# Tertiary Analysis

- Working with BAM/SAM files

## SAM Specification

- Latest vesion SAMv1 (http://samtools.github.io/hts-specs/)

# SAM File Format

\begin{center}
\includegraphics[height=.8\textheight]{images/BAMFormat01General.pdf}
\end{center}

# Header Tags

- `@HD` Version Info

- `@SQ` Genome Information (chrom, size, location, species)

- `@PG` Program tags. Information on programs that create this BAM

- `@RG` Read Groups. Information on origin of sequence data

	- Allows multiple samples to be merged into one BAM
	
- `@CO` Commenents

# Read lines

\begin{center}
\includegraphics[height=1.8\textheight]{images/SAMReadLines.pdf}
\end{center}


# CIGAR format

\begin{center}
\includegraphics[height=1.8\textheight]{images/BAMFormat02CIGAR.pdf}
\end{center}

# Flags

- major headache for humans but the right thing to do.

	- But why on earth is strand bit 4 and not bit 1; the thing you want most should be in the first bit: even == positive, odd == negative
	
	- old samtools had -X option but really not that much better
	
	Dec|Hex|Flags|Dec|Hex|Flags|Dec|Hex|Flags
	-|-|-|-|-|-|-|-|-
	65|0x41|p1|69|0x45|pu1|73|0x49|pU1
	81|0x51|pr1|97|0x61|pR1|113|0x71|prR1
	117|0x75|purR1|121|0x79|pUrR1|129|0x81|p2
	133|0x85|pu2|137|0x89|pU2|145|0x91|pr2
	161|0xa1|pR2|177|0xb1|prR2|181|0xb5|purR2
	185|0xb9|pUrR2|321|0x141|p1s|329|0x149|pU1s
	337|0x151|pr1s|353|0x161|pR1s|369|0x171|prR1s
	377|0x179|pUrR1s|385|0x181|p2s|401|0x191|pr2s
	417|0x1a1|pR2s|433|0x1b1|prR2s|1089|0x441|p1d
	1097|0x449|pU1d|1105|0x451|pr1d|1121|0x461|pR1d
	1137|0x471|prR1d|1145|0x479|pUrR1d|1153|0x481|p2d
	1161|0x489|pU2d|1169|0x491|pr2d|1185|0x4a1|pR2d


# Flags; better solution

- PICARD page is a life saver; bookmarkit or download it
https://broadinstitute.github.io/picard/explain-flags.html

# SAM file example (from STAR)

\begin{center}
\includegraphics[height=1.8\textheight]{images/SAMOutput_0.pdf}
\end{center}


# Manipulating SAM/BAM files

## Samtools vs Picard

- When there is overlap, my honest advice, use Picard

- Unless you are doing pipes/streams

	- But probably should not be doing those anyway
	
- However `samtools view` is prehaps the most used samfile command ever (really)

	- go over options
	
# Samtools

\scriptsize

```bash
$ samtools

Version: 1.3.1 (using htslib 1.3.1)

**   faidx          index/extract FASTA
     index          index alignment

     reheader       replace BAM header
!!   rmdup          remove PCR duplicates # Careful Do not Use

**   mpileup        multi-way pileup
     sort           sort alignment file # Sort to pipes
     quickcheck     quickly check if SAM/BAM/CRAM file appears intact

     flagstat       simple stats
     idxstats       BAM index stats

     flags          explain BAM flags
*    tview          text alignment viewer
**** view           SAM<->BAM<->CRAM conversion # cat for BAMs
```


		
# PICARD

- manipulating SAM/BAMs

	- AddRG, Sort, Index & MarkDup in almost every pipeline
	
	- Mark Duplicates a key step in many cases

- BAM stats

	- Alignment Stats
	
	- Insert Size
	
	- Duplicates Stats

	- and a bunch of misc other stuff

- Wins award for friendliest bioinformatics tool

	- Again honest advice if Picards does what you need use it over other tools. 

# Core modules for Variant Pipeline

- AddOrReplaceReadGroups (AddCommentsToBam)
	
	- This one module can do three key step to convert raw SAM output from mappers to BAM
	
		- Add ReadGroups
		- Sort (in same step)
		- Index

- MergeSamFiles

	- Often the Mapping phase is chunked into blocks need to merge before next step
	
- MarkDuplicates (MarkDuplicatesWithMateCigar)

	- Gets it own slides
	
- Metrics

# Metrics

\scriptsize

```
CalculateHsMetrics					CollectRrbsMetrics
CollectAlignmentSummaryMetrics		CollectSequencingArtifactMetrics
CollectBaseDistributionByCycle		CollectTargetedPcrMetrics
CollectGcBiasMetrics				CollectVariantCallingMetrics
CollectHiSeqXPfFailMetrics			CollectWgsMetrics
CollectHsMetrics					CollectWgsMetricsFromQuerySorted
CollectInsertSizeMetrics			CollectWgsMetricsFromSampledSites
CollectJumpingLibraryMetrics		CompareMetrics
CollectMultipleMetrics				ConvertSequencingArtifactToOxoG
CollectOxoGMetrics					EstimateLibraryComplexity
CollectQualityYieldMetrics			MeanQualityByCycle
CollectRawWgsMetrics				QualityScoreDistribution
CollectRnaSeqMetrics
```

# Metrics

\scriptsize

```
CalculateHsMetrics					
CollectAlignmentSummaryMetrics		
		
CollectHsMetrics					
CollectInsertSizeMetrics			

									ConvertSequencingArtifactToOxoG
CollectOxoGMetrics					

CollectRnaSeqMetrics
```

# Mark Duplicates

\begin{center}
\includegraphics[height=.9\textheight]{images/MarkDups1.pdf}
\end{center}

# How to indentify duplicates

- Duplicates might come from the same input DNA template, so we will assume that reads will have same start position on reference

	–  “Where was the first base that was sequenced?”
	
	–  For paired-end (PE) reads, same start for both ends

- Identify duplicate sets, then choose representaive read based on base quality scores and other criteria

- Lots of complications:

	- clipping (MarkDuplicatesWithMateCigar)
	- ...

# Picard tool MarkDuplicates

- Duplicate status is indicated in SAM flag

- Duplicates are not removed, just tagged (unless you request removal)

- Downstream tools can read the tag and choose to ignore those reads

- Most GATK tools ignore duplicates by default

# Sometimes do not want to do this.

- Amplicon sequencing (PCR based assay)

	- all reads start at same position by design

> In somecase if the depth is too large MarkDup's will crash


# Different kinds of Noise

- Random/uncorrelated (White) vs correlated/structured/biases (colored)

- Both present challenges for algorithms but non-white noise in many contexts can be especially difficult (if not impossible). 
	
	- PCR Duplicates (MarkDups)
	
	- Adapter sequences (Clip)

# Multi-mapper issue

* Many pipeline simple filter these reads out.

* BWA MEM problem

    * No longer sets simple flag
    
    * if using filter on MAPQ

* If using multi-mappers in uniq-mode need to really make sure:

	* how the algorithm deals with high multiplicity
	
	* random choice?
    
* Bowtie/SHRiMP for exhaustive multi-mappers

* CSEM (http://deweylab.biostat.wisc.edu/csem/)

	* impute likely position of multi-mappers by looking at surronding unique mappers. 


# Other bioinformatics file formats: BED files

- BED (0-offset)

	- standard 3 column format: 
		- chromsome
		- start (first base is 0)
		- end
	
	- various extended version

# Picard interval lists

- Used by Picard: 
- Genome Header so you know what the reference is
- Standard 5 column format
	- Chromsome
	- Start (first base is 1)
	- End
	- Strand (REQUIRED)
	- Feature Name (REQUIRED)
	
# Other range formats: GTF,GFF

- GFF/GTF: General Feature Format (1-offset)

	- 9 Columns (see http://www.ensembl.org/info/website/upload/gff.html)

		- but 9th column is a COMMENT field that can pretty much hold anything
		  arbtrary key/value pairs
	  
- GTF: General Transfer Format == GFF v2

	- GFF with "rules" (kind of) about what goes in column 9
	
# Other range formats; UCSC

## General Formats:

![](images/otherFormats.png)


# Swiss Army knife of range formats

## BEDTOOLS

- Genome Arithmetic

- Handles:

	- BED
	- BAM
	- GFF/GTF
	- VCF
	
- Another package that is also very useful: GenomicRanges in `R`

# Lab 3
