#!/bin/bash

# Given a .bam file, the scripts calculates the miniumum,
# maximum, mean, median and standard deviation coverage.
# Requires samtools.

# If you want to run this on several .bam files at once, try
# ls *.bam | xargs -I bamfile ./bam_coverage.sh bamfile

file="$1"
echo '###########################################################'
echo "Coverage for '$file'"
echo '###########################################################'

# Uses samtools mpileup to get coverage. Suppress stderr.

samtools mpileup -A "$file" 2> /dev/null |

# Pipe to awk to pull out the coverage numbers.

awk '

# The numbers we need later.

{ all[NR]=$4
  sum+=$4
  sumsq+=$4*$4
}
END {

# Sort the depths to make it easy to get min and max.

  asort(all)

# Print all of the numbers we calculate to stdout.

  print "Minimum:            ",all[1]
  print "Maximum:            ", all[NR]
  print "Mean:               ", sum/NR
  if (NR % 2) {
    print "Median:             ", all[(NR+1)/2]
} else {
    print "Median:             ", (all[(NR/2)] + all[(NR/2)+1])/2.0
}
  print "Standard deviation: ", sqrt(sumsq/NR - (sum/NR)**2)
}'
echo ""
