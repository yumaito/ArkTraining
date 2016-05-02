package Jobeet::Test;
use Ark 'Test';

use File::Temp qw/tempdir/;
use Jobeet::Models;

sub import {
  my ($class,$app,%options) = @_;
  $app ||= 'Jobeet';
  {
    my $dir = tempdir(CLEANUP =>1);
    models('conf')->{database} = [
      'dbi:mysql:testForArktest','root','',
      {
        mysql_enable_utf8 => 1,
        on_connect_do     => ['SET NAMES utf8'],
      }
    ]
  }
  @_ = ($class,$app,%options);
  goto $class->can('SUPER::import');
}

1;
