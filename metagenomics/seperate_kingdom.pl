#! /usr/bin/perl -w
##########################################################################
#### Author: Ping HU
#### 
##########################################################################
use strict;
my $usage="$0  [abundancefile] first line is title\n"; 
die $usage unless @ARGV ==1;
my ($file) = @ARGV;



open (B, "<$file")||die "could not open $file\n";
my $x=<B>;
chomp $x;
for ($x){s/\r//gi;}
my @tt=split /\t/, $x;


open (D, ">$file.bacteria")||die "could not open $file.bacteria\n";
print D  $x, "\tTaxonLevel\tKingdom\n";
open (E, ">$file.virus")||die "could not open $file.virus\n";
print E  $x, "\tTaxonLevel\tKingdom\n";
open (F, ">$file.eukaryota")||die "could not open $file.eukaryota\n";
print F $x, "\tTaxonLevel\tKingdom\n";
open (G, ">$file.archaea")||die "could not open $file.archaea\n";
print G $x, "\tTaxonLevel\tKingdom\n";
while (my $b=<B>){
    chomp $b;
    my @tmp=split /\t/, $b;
  
    my $line= $b;
    my @LL=split /\|/, $tmp[0];
    my $level=scalar(@LL);
    $line.="\t$level\t".$LL[0]. "\n";
   
    if($tmp[0] =~ /k__Bacteria/){
	print D $line;

    }elsif($tmp[0] =~ /k__Archaea/){
	print G $line;
    }elsif($tmp[0] =~ /k__Eukaryota/){
	print F $line;
    }elsif($tmp[0] =~ /k__Viruses/){
	print E $line;
    }
}
close B;

close D;
close E;
close F;
close G;

