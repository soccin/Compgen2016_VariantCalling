# C.elegans test genome

## Build test set

For many of the exercises I used a reduced version of the human genome with just a small subset of chromosomes to limit the size of the various files. In particular the STAR index of the full human genome is over 30Gb. 

If there is time do the same thing for the C.elegans genome. 

- Use samtools to extract two chromosomes to make a reduced genome

	- Be neat, create a dedicate folder to hold local genomes
	
	- Suggestion from iGenomes: `$HOME/Genomes/$SPECIES/$SOURCE/$BUILD`

- Index it and build the sequence dictionary (*hint* PICARD)

- Build indexes for bwa and STAR

- Create some test data for mapping:

	- try using bedtools (not what i used)
	
	Here is a trick to get 100,000 random points over two chromosomes
	```
		cat /dev/urandom \
		| awk '{printf("chr%.0f\t%.0f\n",int(2*rand())+21,1000000*rand())}' \
		| head -100000
	```

	- find, download, and install the program `wgsim`
		
		- *hint* get zipfile version
		
	
	- read manual and generate 100,000 reads 35mers with default settings
	
- Map with bwa

- Visualize with IGV