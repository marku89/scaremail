#!/bin/bash
# Marku89
INPUT="/tmp/input.txt"
OUTPUT="/tmp/output.txt"
# get some lines of text
perl generator/ConsoleGen.pl > $INPUT
# Change the normal random text to NSA 
python ScareMailTextSwapper.py -i $INPUT -o $OUTPUT
# cleanup the html tags
sed -i 's/<br><br>//g;s/"//g' $OUTPUT
#cat $OUTPUT ##debug
# Now send the mail 
perl sendmail.pl $OUTPUT
