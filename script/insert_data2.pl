#!/bin/perl
use strict;
use warnings;
use FindBin::libs;

use Jobeet::Models;
use DateTime;

my $jobs_rs = models('Schema::Job');
my $cat_rs = models('Schema::Category');

my $cat_programming = $cat_rs->find({name=>'Programming'});
my $job = $jobs_rs->create({
  type => 'full-time',
  category_id => $cat_programming->id,
  company => 'Sensio Labs',
  position => 'Web Developer',
  location => 'Beijin, China',
  description => 'Welcome to our company',
  how_to_apply => 'Send your resume to lorem.ipsum [at] dolor.sit',
  is_public => 1,
  is_activated => 1,
  token => 'job_yet1',
  email => 'job@example.com',
});
