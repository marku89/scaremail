#!/usr/bin/perl
# marku89
# Generates Content for raw I/O
###
# use pipe "perl ConsoleGen.pl 500 > file.txt" to dump it into files
###

use strict;
use warnings;

my $lines = 20;  # count of line , read from arguements, default 20
my $filepath = "data/input.txt";

#read args
foreach my $in (@ARGV)
{
   if ( $in =~ m/help/ )
   {
      print "Help message";
   }
   if ( $in =~ m/(\d+)/ ) 
   {
      $lines = $1;
   }
}

#print "lines get $lines"; #debug
my $linesoffile = `wc -l < $filepath`;
my $ra = $linesoffile; # range of random
my $random; #init random 
my $out; #init output
open my $INPUT, $filepath or die ("FAILed to open file !!");

for (my $i=0; $i <= $lines; $i++)
{
   $random = int(rand($ra));
   $out=`sed -n -e ${random}p $filepath`;
   print "$out\n";
}
