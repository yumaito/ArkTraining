package Jobeet::Schema::Result::Job;
use v5.22.1;
use strict;
use warnings;
use parent 'Jobeet::Schema::ResultBase';
use Jobeet::Schema::Types;


# ここにテーブル定義
__PACKAGE__->table('jobeet_job');
__PACKAGE__->add_columns(
  id => PK_INTEGER,
  type => VARCHAR,
  location => VARCHAR,
  description => TEXT,
  how_to_apply => TEXT,
  token => VARCHAR,
  is_public => TINYINT,
  is_activated => TINYINT,
  email => VARCHAR,
  expires_at => DATETIME,
  created_at => DATETIME,
  updated_at => DATETIME,
);

__PACKAGE__->set_primary_key('id');
__PACKAGE__->add_unique_constraint(['token']);

__PACKAGE__->belongs_to(category=>'Jobeet::Schema::Result::Category','category_id');

1;
