package File::Restore;
use 5.008001;
use strict;
use warnings;

use File::Copy;
use File::Temp qw( tempfile );

our $VERSION = "0.01";

sub new {
    my ( $class, $file, %options ) = @_;

    return unless $file && -f $file;

    # tempfile(OPEN => 0) outputs a warning.
    my ( $fh, $temp_file ) = tempfile(%options);
    close $fh;

    copy( $file, $temp_file ) or return;

    bless { file => $file, temp_file => $temp_file }, $class;
}

sub restore {
    my $self = shift;
    copy( $self->{temp_file}, $self->{file} );
}

1;
__END__

=encoding utf-8

=head1 NAME

File::Restore - Restore changed file.

=head1 SYNOPSIS

    use File::Restore;

    my $r = File::Restore->new('test.jpg', CLEANUP => 0);

    ...

    $r->restore;

=head1 DESCRIPTION

File::Restore can restore changed file.

=head1 INTERFACE

=head2 Methods

=head3 C<< my $r = File::Restore->new($file, %options) >>

Copy $file with a temporary name. Various options may be set in %options,
which pass to File::Temp::tempfile().

=head3 C<< $r->restore() >>

Restore file.

=head1 LICENSE

Copyright (C) Masahiro Iuchi.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Masahiro Iuchi E<lt>masahiro.iuchi@gmail.comE<gt>

=cut

