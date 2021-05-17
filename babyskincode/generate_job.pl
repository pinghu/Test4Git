#! /usr/bin/perl -w
##########################################################################
#### Author: Ping HU
#### 
##########################################################################
use strict;
my $usage="$0  [file] first line is title\n"; 
die $usage unless @ARGV ==1;
my ($file) = @ARGV;

open (A, "<$file")||die "could not open $file\n";
open (B, ">select.job")||die "could not open kegg.job\n";

while (my $X=<A>){
    chomp $X;
    for($X){s/\r//gi;}
    print B "Rscript Gprofiler2.R $X\n";
}
close A;
close B;
system("chmod 777 select.job\n");
