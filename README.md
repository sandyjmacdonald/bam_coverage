bam_coverage.sh
============

Given a .bam file, the scripts calculates the miniumum, 
maximum, mean, median and standard deviation coverage.

### Dependencies

Requires [Samtools](http://www.htslib.org) to parse the .bam file and
return the depths across the mapping file.

### Usage

    ./bam_coverage.sh <mapping.bam>

### Tips

You'll need to make the script executable with either:

    chmod a+x bam_coverage.sh

or alternatively:

    chmod 777 bam_coverage.sh

If you want to run the script on several .bam files in a directory and 
capture the information returned in a text file then try this:

    ls *.bam | xargs -I bamfile ./bam_coverage.sh bamfile
