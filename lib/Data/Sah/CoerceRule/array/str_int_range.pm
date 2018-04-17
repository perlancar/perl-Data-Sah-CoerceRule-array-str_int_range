package Data::Sah::CoerceRule::array::str_int_range;

# DATE
# VERSION

1;
# ABSTRACT: Coerce array of ints from string in the form of "INT1-INT2"

=head1 DESCRIPTION

This distribution contains Data::Sah coercion rule to coerce array of ints from
string in the form of "INT1-INT2" string. The rule is not enabled by default.
You can enable it in a schema using e.g.:

 ["array*", of=>"int", "x.coerce_rules"=>["str_int_range"]]


=head1 SEE ALSO

L<Data::Sah::Coerce>

L<Data::Sah>
