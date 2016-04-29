use strict;
use warnings;
use FindBin::libs;
use List::Util;

use Jobeet::Models;

my $job_rs = models('Schema::Job');# jobテーブル
my $cat_rs = models('Schema::Category'); #categoryテーブル

my @categories = qw/Design Programming Manager Administrator/;
my @types = qw/full-time part-time/;
my @programmings = ('Web Developer','Engineer');
my @locations = ('Paris, France','Tokyo, Japan','Beijing, China','London, UK','New York, USA');

my $prog = models('Schema::Category')->find({ name => 'Programming'});
my $design = models('Schema::Category')->find({ name => 'Design'});
my $manager = models('Schema::Category')->find({name => 'Manager'});
my $admin = models('Schema::Category')->find({name => 'Administrator'});

# Programming
for my $i (100..130){
  my @programmings2 = List::Util::shuffle @programmings;
  my @locations2 = List::Util::shuffle @locations;
  my @t2 = List::Util::shuffle @types;
  my $job = $job_rs->create({
    type => $t2[0],
    category_id => $prog->id,
    company => "Company $i",
    position => $programmings2[0],
    location => $locations2[0],
    description => "Welcome",
    how_to_apply => "Send your resume",
    is_public => 1,
    is_activated => 1,
    token => "prog_$i",
    email => 'job@example.com',
  });
}
# Designer
for my $i (100..130){
  my @locations2 = List::Util::shuffle @locations;
  my @t2 = List::Util::shuffle @types;
  my $job = $job_rs->create({
    type => $t2[0],
    category_id => $design->id,
    company => "Company $i",
    position => "Designer",
    location => $locations2[0],
    description => "Welcome",
    how_to_apply => "Send your resume",
    is_public => 1,
    is_activated => 1,
    token => "design_$i",
    email => 'job@example.com',
  });
}
# Manager
for my $i (100..130){
  my @locations2 = List::Util::shuffle @locations;
  my @t2 = List::Util::shuffle @types;
  my $job = $job_rs->create({
    type => $t2[0],
    category_id => $manager->id,
    company => "Company $i",
    position => "Manager",
    location => $locations2[0],
    description => "Welcome",
    how_to_apply => "Send your resume",
    is_public => 1,
    is_activated => 1,
    token => "manager_$i",
    email => 'job@example.com',
  });
}
# Administrator
for my $i (100..130){
  my @locations2 = List::Util::shuffle @locations;
  my @t2 = List::Util::shuffle @types;
  my $job = $job_rs->create({
    type => $t2[0],
    category_id => $admin->id,
    company => "Company $i",
    position => "Administrator",
    location => $locations2[0],
    description => "Welcome",
    how_to_apply => "Send your resume",
    is_public => 1,
    is_activated => 1,
    token => "admin_$i",
    email => 'job@example.com',
  });
}
