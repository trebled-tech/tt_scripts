#!/bin/bash

# converts Apple Notes format to plaintext using pandoc, and sets the timestamp on the resulting text file to match timestamp that was on the original Notes file

while read file
do
  tname="$(echo "$file" |cut -d "." -f1).txt"
  ftstamp=$(stat -l -t %Y%m%d%H%M $file | awk '{print $6}')
  pandoc "$file" -f markdown -s -o $tname
  touch -t $ftstamp $tname
done < filelist
