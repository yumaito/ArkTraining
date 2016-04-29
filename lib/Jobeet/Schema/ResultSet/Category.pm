package Jobeet::Schema::ResultSet::Category;
use strict;
use warnings;
use utf8;
use parent 'DBIx::Class::ResultSet';

use Jobeet::Models;

sub get_with_jobs {
  my $self = shift;
  $self->search(
    {'jobs.expires_at' => { '>=', models('Schema')->now}},
    { join => 'jobs',group_by => 'me.name'},
  );
}

sub get_category_jobs {
  my $self = shift;
  my $category = shift;
  # print "\$category = $category\n";
  my $cateid = models('Schema::Category')->find({ name => $category})->id;
  # print "\$category = $category\n";
  # print "id = $cate\n";
  $self->search(
    # {'jobs.expires_at' => { '>=', models('Schema')->now}},
    {'jobs.category_id' => {'=', $cateid}},
    { join => 'jobs',group_by => 'me.name'},
  );
}
1;
