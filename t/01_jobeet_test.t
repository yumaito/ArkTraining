use strict;
use warnings;
use Test::More tests => 1;

use Jobeet::Test;
use Jobeet::Models;

# confのdatabase[0]が'dbi:mysql:testForArktest'にマッチするかどうかをテスト
my $dbpattern = "dbi:mysql:testForArktest";
like models('conf')->{database}[0],qr{$dbpattern},'connect mock database after "use Jobeet::Test"';
