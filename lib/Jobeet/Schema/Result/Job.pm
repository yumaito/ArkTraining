package Jobeet::Schema::Result::Job;
use v5.22.1;
use strict;
use warnings;
use parent 'Jobeet::Schema::ResultBase';
use Jobeet::Schema::Types;
use Jobeet::Models;


# ここにテーブル定義
__PACKAGE__->table('jobeet_job');
__PACKAGE__->add_columns(
  id => PK_INTEGER,
  category_id => INTEGER,
  type => VARCHAR,
  position => VARCHAR,
  location => VARCHAR,
  description => TEXT,
  how_to_apply => TEXT,
  token => VARCHAR,
  company => VARCHAR(
    is_nullable => 1
  ),
  logo => VARCHAR(
    is_nullable => 1,
  ),
  url => VARCHAR(
    is_nullable => 1
  ),
  is_public => TINYINT(
    default_value => 1,
  ),
  is_activated => TINYINT,
  email => VARCHAR,
  expires_at => DATETIME,
  created_at => DATETIME,
  updated_at => DATETIME,
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->add_unique_constraint(['token']);

__PACKAGE__->belongs_to(category=>'Jobeet::Schema::Result::Category','category_id');

sub insert {
  # jobのinsert時に呼ばれるサブルーチン
  my $self = shift;# 引数受け取り
  $self->expires_at(models('Schema')->now->add(days => models('conf')->{active_days}));
  # 現在時刻+confの{active_days}をexpires_atとする。
  $self->next::method(@_);
}

1;
