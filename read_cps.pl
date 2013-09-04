#!/usr/bin/env perl
use Modern::Perl 2011;
use autodie;

use Data::Dumper;
use Spreadsheet::Read;
use English qw( -no_match_vars );

my $book = ReadData("cps.xls");

my $d = Data::Dumper->new($book);
print $d->Dump or croak $OS_ERROR;