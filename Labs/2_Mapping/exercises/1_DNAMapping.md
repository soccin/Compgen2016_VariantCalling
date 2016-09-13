# DNA mappers

## Preliminaries

### Check path to mapping programs

Most of the modern mappers are pretty easy to use; at least in default mode. First check that 

* `bwa`

* `bowtie2`

* `STAR`

are on your path. Just time the name of the command and you should get a nice help screen. For example:
```
$ bwa

Program: bwa (alignment via Burrows-Wheeler transformation)
Version: 0.7.12-r1039
Contact: Heng Li <lh3@sanger.ac.uk>

Usage:   bwa <command> [options]

Command: index         index sequences in the FASTA format
         mem           BWA-MEM algorithm
...
```

The one exception is `STAR`. Note only does it have a pretty useless default output
```
$ STAR

EXITING because of fatal input ERROR: could not open readFilesIn=Read1

Oct 18 21:38:26 ...... FATAL ERROR, exiting
```

it does not even have a `-h`, `--help`, `-m` or any of the typical options most unix commands have to get a help or man screen. There is actually on one quasi-useful one: 
```
$ STAR --version 
STAR_2.4.2a
```

and it leaves a mess of files. If you want clean up do
```
	rm -r Aligned.out.sam Log.out Log.progress.out _STARtmp/
```

But so long as you do not see:
```
$ STAR
-bash: STAR: command not found
```

they are on your path and executable.

Another way to tell if a command is on your path is to type:
```
	which CMD
```

and if it is on your path you will see the full directory path to the CMD. 

### Get test genome path

All of the data for this exercise used a reduced version of the human genome (UCSC build hg19) which contained Chromosomes chr4, chr7, chr12, chr14 and chr17. This was to the reduce the size of the files, the amount of memory needed and to reduce run time. The path to the root folder with all the necesarry genome files is:

```
$ROOT45/genomes/H.Sapiens/b37_hl
```

Remember that `$ROOT45` is the folder we previous set in our `config.sh` file in `~/Day45/code`. Now is a good time to add some more useful variables to your `config.sh` file. There is not hard and fast convention but I recommend:

```bash
# Compgen2016 Day 4,5 configuration file

# Path to root of lab data directories

ROOT45=/share/data/compgen2016/day45_Intro2Seq_VarCalling

# Genome files

GENOME_BUILD=human_b37
GENOME_ROOT=$ROOT45/genomes/H.Sapiens/b37_hl
GENOME_FASTA=$GENOME_ROOT/b37_hl.fa
GENOME_DICT=$GENOME_ROOT/b37_hl.dict
GEMOME_BWAIDX=$GENOME_ROOT/index/bwa/b37_hl.fa
```

Once you have your `config.sh` file setup with the new variables remember to `source` it to get those variables set in your environment. Remember you need to source this file for every new terminal window. If you like you can add this source command to your `.profile` or `.bashrc` file so it is done automatically. 

To check that everything is working ok do the following:

```
$ cat ${GENOME_FASTA}.fai
```

if all is good you should see:
```
4	191154276	52	60	61
7	159138663	194340285	60	61
12	133851895	356131314	60	61
14	107349540	492214128	60	61
17	81195210	601352880	60	61
```

which is the `samtools` fasta index for this genome.

## Mapping synthetic DNA data.

To generate these datasets I used the program `wgsim` from the author of BWA. It is not installed but is prehaps the easiest program of all the ones you are looking at to install. At the end of this exercise I have the location for it for those you want to play with generating their own data. 


### Building indexes

Normally the first step when using a mapper for the first time with a new genome is to build the genome index. This is a time consuming process but it greatly speeds up the subsequent mapping runs. 

To save time I have pre-build the indexes for three aligners on the test hg19 genome. However if you are comfortable with UNIX and the command line and would like to get some experience with index building please do so. If you re-build the indexes make sure you keep track of where they are. 


### Data set 1: default wgsim generated

The first test is a single end run and consists of one file:
```
	$ROOT/Intro2NextGen/2_Mapping/data/hg19Test2_DEF_1_SE.fastq.gz
```

This one is a single end set so just one read file. Map it with BWA, Bowtie and even though it is DNA data try and map it with STAR. 

For BWA use BWA MEM first. If you have time you can experiment with the other modes of BWA. For Bowtie and STAR (and BWA-MEM) us default mapping options.

The main point of this exercise is to learn how to use the mappers; so I am not going to give explicit command lines for each. Look at the help screens (remember STAR does not have one) look at the manuals. You can go online for BWA and Bowtie; STAR's manual is a PDF so I put it in the repository at:
```
	$ROOT/Compgen2015/Course/Intro2NextGen/man/STAR
```

Note, all the mappers output uncompressed plain text SAM files so you can look at them with `more` or `less` or maybe open them with an editor. In fact if you take the first 10-20 lines (with head) you can maybe even open them in excel or some other spreadsheet program. 

Some things to do. 

- Record the time it takes to run each. 

	- To time a command you can use the unix `time` function. If you do
	```
	time COMMAND
	```
	
	That will run the command and print out the time it took. 
	
	Timing benchmarks are notoriously hard to get right. We do not want to get bogged down here on that but I suggests running each program twice and taking the smaller of the two numbers. But if you have time and ideas try other testing strategies

	- Do you understand why STAR is not used for everything
	
- Check the % of mapped reads. Think about how to do this; but do not spend too much time. There is a quick script in:
  ```bash
  $ROOT/Compgen2015/Course/Intro2NextGen/2_Mapping/code/calcPercentMapped.sh
  ```
  
  which will give the %-mapped and unmapped. In the next module we will use a much more powerfull program to compute mapping statistics. 

- Look at the different SAM files in details. In particular look at the TAGS, especially the custom tags for each. 
	  - BWA: XA, XS
	  - Bowtie: XG, XM, XN, XO, XS
  You should learn what those they mean and while there is no point memorizing them you should be able to know how to find the meanings of them when needed
  

### Data set 2: paired end data set

The second set is paired end data. There are two files this time
```
hg19Test2_DEF_2_R1.fastq.gz
hg19Test2_DEF_2_R2.fastq.gz
```

This follows the Illumina convention: R1 is the 'left' read, R2 the 'right' (in sequencing space not necessary genome space)

Map this data; all the mappers have modes for paired end mapping. You can drop STAR now unless you are no convinced it is a good idea for DNA sequencing.

Do the same things you did for the single end case:

* Time them

* Measure % mapped/unmapped

* Look into the files
  
Then if there is time; play with the various options in the mappers and see how they effect things. Maybe try BWA ALN (which is not really used anymore but had some nice properties). If you are really adventurous the extra credit is to find other mappers to download and try them; SHRiMP is a personal favorite but it is no longer maintained. But if you need to deal with color data from the SOLiD sequencer is is one of the easiest to use. 

### Data set 3: real ChIP seq data

This data was too big to put in the course folder on GitHub so it is in a separate folder on the share drive. Copy to you local computer and make sure you keep track of where you put it. Call this path `$DATA`, you can then find the ChIPseq data at:
```bash
	$DATA/Intro2NextGenMaterials/data/2_Mapping
```

and the files are:
```bash
	sample_DNA_Real_ChIP_Med_SE.fastq.gz
	sample_DNA_Real_Input_Med_SE.fastq.gz
```

Map this data with the mapper of your choice. We will use it in the next two labs.
Note, it is single end data with two (2) different samples.

These datasets are large so they might take awhile to map. I suggest running in the background and moving on to the next step mapping RNAseq data

