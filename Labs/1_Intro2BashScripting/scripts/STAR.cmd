
STAR \
	--genomeDir $ROOT45/genomes/H.Sapiens/b37_hl/index/star/NoGTF \
    --readFilesIn \
    	$ROOT45/Labs/1_Intro2BashScripting/data/testTiny_R1.fastq.gz \
    	$ROOT45/Labs/1_Intro2BashScripting/data/testTiny_R2.fastq.gz \
    --readFilesCommand gzcat 

