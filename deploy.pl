use v5.22.1;
use strict;
use warnings;
use utf8;
use lib "lib";
use lib "local";

use Jobeet::Schema;
my $d = 'dbi:mysql:arktest';
my $u = 'root';
my $schema = Jobeet::Schema->connect(
  $d,$u,
);
$schema->deploy;
