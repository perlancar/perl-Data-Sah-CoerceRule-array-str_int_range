package Data::Sah::Coerce::perl::array::str_int_range;

# DATE
# VERSION

use 5.010001;
use strict;
use warnings;

sub meta {
    +{
        v => 3,
        enable_by_default => 0,
        might_fail => 1,
        prio => 60, # a bit lower than normal
    };
}

sub coerce {
    my %args = @_;

    my $dt = $args{data_term};

    my $res = {};

    $res->{expr_match} = "!ref($dt) && $dt =~ /\\A\\s*[+-]?\\d+\\s*(?:-|\\.\\.)\\s*[+-]?\\d+\\s*\\z/";

    $res->{expr_coerce} = join(
        "",
        "do { ",
        "my (\$int1, \$int2) = $dt =~ /\\A\\s*([+-]?\\d+)\\s*(?:-|\\.\\.)\\s*([+-]?\\d+)\\s*\\z/; ",
        "if (\$int2 - \$int1 > 1_000_000) { ['Range too big'] } ",
        "else { [undef, [\$int1+0 .. \$int2+0]] } ",
        "}",
    );

    $res;
}

1;
# ABSTRACT: Coerce array of ints from string in the form of "INT1-INT2"

=for Pod::Coverage ^(meta|coerce)$

=head1 DESCRIPTION

The rule is not enabled by default. You can enable it in a schema using e.g.:

 ["array*", of=>"int", "x.coerce_rules"=>["str_int_range"]]
