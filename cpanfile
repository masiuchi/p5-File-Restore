## -*- mode: perl; coding: utf-8 -*-
requires 'perl', '5.008001';

requires 'File::Copy';
requires 'File::Temp';

on 'test' => sub {
    requires 'File::Basename';
    requires 'File::Spec';
    requires 'Test::More', '0.98';
};

