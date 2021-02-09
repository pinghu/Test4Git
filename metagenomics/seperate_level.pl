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
open (D1, ">$file.1")||die "could not open $file.1\n";
print D1  $x, "\n";
open (D2, ">$file.2")||die "could not open $file.2\n";
print D2  $x, "\n";
open (D3, ">$file.3")||die "could not open $file.3\n";
print D3  $x, "\n";
open (D4, ">$file.4")||die "could not open $file.4\n";
print D4 $x, "\n";
open (D5, ">$file.5")||die "could not open $file.5\n";
print D5 $x, "\n";
open (D6, ">$file.6")||die "could not open $file.6\n";
print D6 $x, "\n";
open (D7, ">$file.7")||die "could not open $file.7\n";
print D7 $x, "\n";
open (D8, ">$file.8")||die "could not open $file.8\n";
print D8 $x, "\n";



while (my $b=<B>){
    chomp $b;
    my @tmp=split /\t/, $b;
    my @LL=split /\|/, $tmp[0];
    my $level=scalar(@LL);
    if($level==1){
	print D1 $b, "\n";
    }elsif($level==2){
	print D2 $b, "\n";
    }elsif($level==3){
	print D3 $b, "\n";
    }elsif($level==4){
	print D4 $b, "\n";
    }elsif($level==5){
	print D5 $b, "\n";
    }elsif($level==6){
	print D6 $b, "\n";
    }elsif($level==7){
	print D7 $b, "\n";
    }elsif($level==8){
	print D8 $b, "\n";
    }

}
close B;

close D1;
close D2;
close D3;
close D4;
close D5;
close D6;
close D7;
close D8;

