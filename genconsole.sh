#!/bin/bash
# Marku89
INPUT="/tmp/input.txt"
OUTPUT="/tmp/output.txt"
perl generator/ConsoleGen.pl > $INPUT
python ScareMailTextSwapper.py -i $INPUT -o $OUTPUT
sed -i 's/<br><br>//g;s/"//g' $OUTPUT
cat $OUTPUT
