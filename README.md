# NAME

File::Restore - Restore changed file.

# SYNOPSIS

    use File::Restore;

    my $r = File::Restore->new('test.jpg', CLEANUP => 0);

    ...

    $r->restore;

# DESCRIPTION

File::Restore can restore changed file.

# INTERFACE

## Methods

### `my $r = File::Restore->new($file, %options)`

Copy $file with a temporary name. Various options may be set in %options,
which pass to File::Temp::tempfile().

### `$r->restore()`

Restore file.

# LICENSE

Copyright (C) Masahiro Iuchi.

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Masahiro Iuchi &lt;masahiro.iuchi@gmail.com>
