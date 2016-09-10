# BWA vs Bowtie2

* First note we are comparing Bowtie2; Bowtie (version 1) did not do indels (will not map) so much less useful variant calling

* From lh3 (this is Heng Li BWA creator) (http://seqanswers.com/forums/showthread.php?t=15200)

* 11-05-2011, 07:24 AM:

> If you wonder why the sensitivity in the plot is different from that in the bowtie2 poster, that is because 1) bwa-short is indeed not very sensitive on real single-end data without trimming; bwa-sw is much better; 2) That poster is counting all alignments, but I am counting "unique" alignments only. Bowtie2 can map many reads, but it has difficulty in distinguishing good and bad hits and thus give many good hits low mapping quality. Beta3 is much better than beta2 at this point, but still not perfect.

> Basically bowtie2 chooses a nice balance point where it is the fastest without much loss of accuracy in comparison to others, but for variant calling for Illumina data, novoalign/smalt/bwa/gsnap may still be the mapper of choice. Things may change in future of course. Bowtie2 is still in beta, while bwa and bwa-sw are mature (i.e. not many improvements can be made).

http://lh3lh3.users.sourceforge.net/alnROC.shtml


> Nearly all aligners use heuristics. Few of them can guarantee to find the best hit even if the top hit is clearly (i.e. in all sensible scoring schemes) better than other hits. Here are several examples. 

Comparison

 |BWA ALN (v6) | Bowtie2
--|----|--------
Index HG19|9.4Gb|3.8Gb
Speed (from lh3) | 230.1 | 154
Specificity | Better |.
Sensitivity | Better |.

Bowtie2 faster and less memory resources but less sensitive and specific (in some cases 10x). Specificity is key in variant calling. These were for 100mers

Bowtie2 was better at aligning longer reads (like from the 454)

BWA (now up to version 7) has BWA MEM which is suppose to improve both short read and long read and BWASW for long queries



