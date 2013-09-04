package Record;
use Modern::Perl 2011;
use autodie;
use Mouse;

has 'header_names' => (
    is      => 'ro',
    isa     => 'ArrayRef',
    required => 1,
    trigger => sub {
        my $self = shift;
        say join q{;}, @{ $self->header_names };
    },
);

has 'values' => (
    is      => 'ro',
    isa     => 'ArrayRef',
    required => 1,
    trigger => sub {
        my $self = shift;
        say join q{;}, @{ $self->values };
    },
);

__PACKAGE__->meta->make_immutable();

