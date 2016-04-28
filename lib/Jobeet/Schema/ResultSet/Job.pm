package Jobeet::Schema::ResultSet::Job;
use strict;
use warnings;
use utf8;
use parent 'DBIx::Class::ResultSet';

use Jobeet::Models;

# sub get_active_jobs {
#   my $self = shift;
#   # expires_at >= now なデータを探す
#   # 期限が切れていないデータを探す
#   $self = $self->search({
#     expires_at => { '>=', models('Schema')->now },
#   });
#   # expires_atでソートする
#   $self = $self->search({},{ order_by => {-desc => 'expires_at'}});
#   $self;
# }

1;
