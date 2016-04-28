use strict;
use warnings;
use utf8;
use lib 'lib';

use Jobeet::Models;
use Getopt::Long;
use GitDDL;

GetOptions(
    \my %options,
    qw/dry-run/
);

# print "gitddl start\n";
my $dsn = models('conf')->{database}->[0];
# print "${dsn}\n";
my $gd = GitDDL->new(
    work_tree => './',
    ddl_file  => './sql/schema.sql',
    dsn       => models('conf')->{database},
);
#######################
###デバッグ用###########
#### $gdの中身全部見てみる
# for my $key (keys %$gd){
#   print "\$gd->{$key} = ".$gd->{$key}."\n";
# }
# print "1--------------------------\n";
# print $gd->database_version . "\n";
# print "2--------------------------\n";
#######################
#######################

my $db_version = '';
eval {
    open my $fh, '>', \my $stderr;
    local *STDERR = $fh;
    $db_version    = $gd->database_version;
};
# print "${db_version}\n";
if (!$db_version) {
    $gd->deploy;
    print "done migrate\n";
    exit;
}

if ($gd->check_version) {
    print "Database is already latest\n";
} else {
    print $gd->diff . "\n";
    if (!$options{'dry-run'}) {
        $gd->upgrade_database;
        print "done migrate\n";
    }
}
