#!/usr/bin/env perl
use Modern::Perl 2011;
use autodie;

use Data::Dumper;
use Spreadsheet::Read qw( rows ReadData );
use Getopt::Long;
use English qw( -no_match_vars );
use Readonly;
use Record;

Readonly my $NUM => 1;
Readonly my $HEADER_IDX => 0;

my $xlsfile;
my $help;
my $sheet_num = $NUM;

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

my @rows = rows( $book->[$sheet_num] );

my $i = $HEADER_IDX + 1;
while ( $i <= 4 ) {
    my $r = Record->new( header_names => $rows[$HEADER_IDX], values => $rows[$i] );
    $i++;
}
