use strict;
use warnings;
use Test::More tests => 1;

use Jobeet::Test;
use Jobeet::Models;

# confのdatabase[0]が'dbi:mysql:testForArktest'にマッチするかどうかをテスト
my $dbpattern = "dbi:SQLite:/.+jobeet-test-database\.db";
like models('conf')->{database}[0], qr{dbi:SQLite:/.+jobeet-test-database\.db},
  'connect mock database after "use Jobeet::Test"';
