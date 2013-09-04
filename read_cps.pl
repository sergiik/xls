#!/usr/bin/env perl
use Modern::Perl 2011;
use autodie;

use Data::Dumper;
use Spreadsheet::Read;
use Getopt::Long;
use English qw( -no_match_vars );

my $xlsfile;
my $help;

GetOptions(
    'help|?'    => \$help,
    'xlsfile=s' => \$xlsfile,
) or pod2usage(2);

if ( defined $help ) {
    pod2usage( -exitstatus => 0, -verbose => 2 );
}

if ( not defined $xlsfile ) {
    pod2usage(2);
}

my $book = ReadData($xlsfile);

#my $d = Data::Dumper->new($book->[0]);
#print $d->Dump or croak $OS_ERROR;

while ( my ( $k, $v ) = each $book->[0] )        { say "$k $v" }
while ( my ( $k, $v ) = each $book->[0]{sheet} ) { say "$k $v" }
