#!/usr/bin/env perl
use Modern::Perl 2011;
use autodie;

use Data::Dumper;
use Spreadsheet::Read;
use English qw( -no_match_vars );

my $book = ReadData("cps.xls");

#my $d = Data::Dumper->new($book->[0]);
#print $d->Dump or croak $OS_ERROR;

while ( my ( $k, $v ) = each $book->[0] )        { say "$k $v" }
while ( my ( $k, $v ) = each $book->[0]{sheet} ) { say "$k $v" }
