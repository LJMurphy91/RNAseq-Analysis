#########################################################
#RNA - SEQUENCING FASTQ PROCESSING						
#########################################################

#PROCESSING OF 50BP SINGLE FASTQ READS
#ALL FILES SHOULD BE IN THE SAME FOLDER

#########################################################

#1. BUILD REFERENCE INDEX FILES

bowtie2-build -f <reference.fna> reference_name

#########################################################

#2. ALIGN READS TO REFERENCE FILE

bowtie2-align -x reference name -S <output.sam> -U <reads.fq>

#########################################################

#3. RE-INDEX REFERENCE, CONVERT AND SORT .SAM OUTPUT TO .BAM, INDEX SORTED .BAM FILE

samtools faidx <reference.fna>
samtools import <reference.fa.fai> <output.sam> <output.bam>
samtools index sorted.bam

#########################################################

#4. MAP ALIGNED READS TO GENE FEATURES USING FEATURE COUNTS

~/featureCounts -a <reference.gff> -o <counts.txt> -t gene -g locus_tag <file1.sam> <file2.sam> <file3.sam>


