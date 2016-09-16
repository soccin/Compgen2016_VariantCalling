# UCSC Genome Browser

#

There are way better tutorials for the Genome Browswer than I could every hope to do. Some good starting points are:

* https://genome.ucsc.edu/training/index.html

* http://www.sciencedirect.com/science/article/pii/S0888754308000451

* http://www.nature.com/scitable/ebooks/guide-to-the-ucsc-genome-browser-16569863

# IGV

# Setup

* Make sure IGV is installed and runable. Can get a copy here
[www.broadinstitute.org/igv](https://www.broadinstitute.org/igv/ "IGV")

* Get sample BAM files from repository or website our use the ones you generated in the previous exercises

# Load files

* Load some of the sample bam files. Try loading both as a file and also as a URL

# Browse Regions

* Browser to various regions in the genome. Note for the sample BAM files there is only data on chr21, chr22. Browse both by entering coordinates in the region box and also browse by Gene Names. To get the name of genes on chr21 and chr22 use the UCSC browser. 

* Note to see reads in BAM file you need to zoom in to a certain point depending on how much memory you have and the size of the pileup.

* Try moving around with the mouse. Zoom in and zoom out. 

* How to find interesting regions.

# View Controls
 
# Hover info

# Saving Images

# Sessions

# _Advanced_ Fusion detection

In RNAseq data set from the mapping exercise I have spiked in some fusion (translocation) events. However the STAR mapper in its defualt mode will not find the fusion reads. You can read the STAR manual and try to figure out how to adjust it do so but a much easier method is to simply re-map the data with BWA. 

Remap the data and then find the fusions. Look at the in IGV to verify you really got them and identify the fusion partners. You have all the programs you need and all the INFO you need to build your own simple fusion detector. 

# _Advanced_ IGV Batch Files

Given a BED file and a BAM file create IGV batch file(s) that will go to each region in the BAM file and save a snapshot of that region. 

You can either do this using bedtools or by writing a script. 

