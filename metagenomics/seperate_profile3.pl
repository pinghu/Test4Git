#! /usr/bin/perl -w
##########################################################################
#### Author: Ping HU
#### 
##########################################################################
use strict;
my $usage="$0  [file] first line is title\n"; 
die $usage unless @ARGV ==1;
my ($list) = @ARGV;
system("mkdir ./relative_abundance\n");
system("mkdir ./coverage\n");
system("mkdir ./tax_id\n");
system("mkdir ./estimated_number_of_reads_from_the_clade\n");

open (A, "<$list")||die "could not open $list\n";
while (my $a=<A>){
    chomp $a;
    for($a){s/\r//gi;}
    open (B, "<$a")||die "could not open $a\n";
    print STDERR $a, "\n";
    open (C, " >./relative_abundance/$a") ||die "could not open ./relative_abundance/$a\n";

    open (D, ">./coverage/$a")||die "could not open ./coverage/$a\n";
    open (F, ">./tax_id/$a")||die "could not open ./tax_id/$a\n";
    open(E, ">./estimated_number_of_reads_from_the_clade/$a")||die "could not open ./estimated_number_of_reads_from_the_clade/$a\n" ;
    my $nn=<B>;
    print E $nn;
    print C $nn; 
    print D $nn; 
    print F $nn;
    while (my $bb=<B>){
	chomp $bb;
	for($bb){s/\r//gi;}
	my @tmp=split /\t/, $bb;
	if(@tmp <4){print STDERR $bb, "\n";next;}
	print C $tmp[0], "\t", $tmp[2], "\n";
	print D $tmp[0], "\t", $tmp[3], "\n";
	print E $tmp[0], "\t", $tmp[4], "\n";
	print F $tmp[0], "\t", $tmp[1], "\n";
    }
    close B;

    close C;   
    close D;

    close E;   
   close F;
 
		
    
}
close A;
