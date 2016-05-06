#!/bin/perl
use strict;
use warnings;
use FindBin::libs;
use List::Util;

use Jobeet::Models;
use DateTime;

my $datafile = models('home')->sudir(qw/sql fixtures/)->file('default.pl');
do $datafile or die $!;
