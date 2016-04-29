package Jobeet::Controller::Category;
use Ark 'Controller';

use Jobeet::Models;

sub index :Path {
    my ($self, $c) = @_;
    $c->stash->{categories} = models('Schema::Category')->get_with_jobs;
}

sub index :Path :Args(1) {
    my ($self, $c, $args) = @_;
    # print "\$self = ".%{ $self } ."\n";
    # print "\$c = ".%{ $c }. "\n";
    # print "\$args = ${args}\n";
    $c->stash->{categories} = models('Schema::Category')->get_category_jobs($args);
}

1;
