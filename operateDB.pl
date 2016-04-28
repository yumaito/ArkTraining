use strict;
use warnings;
use lib 'lib';
# use lib 'local';

use Jobeet::Schema;
# データベース接続
my $d = 'dbi:mysql:arktest';# arktestに接続
my $u = 'root';
my $schema = Jobeet::Schema->connect(
  $d,$u,
);
#
my $category_rs = $schema->resultset('Category');
# categoryテーブルの結果達
while (my $category = $category_rs->next){
  print $category->name . "\n";
}
