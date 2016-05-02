package Jobeet::Schema::ResultSet::Job;
use strict;
use warnings;
use utf8;
use parent 'DBIx::Class::ResultSet';

use Jobeet::Models;

sub create_from_form {
  my ($self,$form) = @_;

  my $txn_guard = models('Schema')->txn_scope_guard;

  my $category_id = delete $form->params->{category};
  my $category = models('Schema::Category')->find({slug => $category_id})
    or die 'no such category_id:',$category_id;

  my $job = $self->create({
    category_id=>$category->id,
    %{ $form->params },
  });
  # デバッグ用のprint達
  # my %h = %{ $form->params };
  # for (keys %h){
  #   print "$_\n";
  # }
  # ----------------------
  $txn_guard->commit;
  $job;
}

1;
