package Jobeet::Form::Job;

use Ark 'Form';

use Jobeet::Models;

param category => (
  label => 'Category',
  type => 'ChoiceField',
  choices => [map {$_->slug => $_->name } models('Schema::Category')->all],
  constrains => [
    'NOT NULL',
  ]
);

param type => (
  label => 'Type',
  type => 'ChoiceField',
  choices => [
    'full-time' => 'Full time',
    'part-time' => 'Part time',
    'freelance' => 'Freelance',
  ],
  constrains => [
    'NOT NULL',
  ],
);

param company => (
  label => 'Company',
  type => 'TextField',
  constrains => [
    'NOT NULL',
  ],
);

param url => (
  label => 'URL',
  type => 'URLField',
);

param position => (
  label => 'position',
  type => 'TextField',
  constrains => [
    'NOT NULL',
  ],
);

param location => (
  label => 'Location',
  type => 'TextField',
  constrains => [
    'NOT NULL',
  ],
);

param description => (
  label => 'Description',
  type => 'TextField',
  widget => 'textarea',
  attr => {
    cols => 30,
    rows => 4,
  },
  constrains => [
    'NOT NULL',
  ],
);

param how_to_apply => (
  label => 'How to apply?',
  type => 'TextField',
  widget => 'textarea',
  attr => {
    cols => 30,
    rows => 4,
  },
  constrains => [
    'NOT NULL',
  ],
);

param email => (
  label => 'Email',
  type => 'TextField',
  constrains => [
    'NOT NULL',
    'EMAIL_LOOSE',
  ],
);

1;
