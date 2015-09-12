#!/usr/bin/env perl
use strict;
use warnings;
use Test::More;

use File::Basename;
use File::Spec;

use File::Restore;

ok( !File::Restore->new, 'No file' );

my $file = File::Spec->catfile( dirname(__FILE__), 'test.txt' );
my $r = File::Restore->new($file);

ok( $r, 'Created instance' );
is( -s $file, -s $r->{temp_file}, 'Saved' );

open my $fh, '>', $file or die $@;
print $fh "Hello, World!\n";
close $fh;

ok( ( -s $file ) < ( -s $r->{temp_file} ), 'Changed' );

my $temp_file = $r->{temp_file};
ok( $r->restore, 'Restoring succeeded' );
is( -s $file, -s $temp_file, 'Confirmed restoring' );

done_testing;

