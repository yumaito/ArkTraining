use strict;
use warnings;

use Test::More;
use Jobeet::Test;
use Jobeet::Models;

# use FindBin::libs;
use List::Util;
use DateTime;

# テストデータをinsert
my $datafile = models('home')->subdir(qw/sql fixtures/)->file('default.pl');
do $datafile or die $!;

{
    my $c = ctx_get('/job/');
    is $c->req->action->reverse, 'job/index',
      '/job/で/job/indexが呼ばれている';
    is $c->res->status, '200',"200 status ok";
    ok $c->stash->{categories},'categoriesがセットされている';
}
{
    my $c = ctx_get('/job/create');
    is $c->req->action->reverse, 'job/create',
      '/job/createで/job/createが呼ばれている';
    is $c->res->status, '200',"200 status ok";
}
{
    my $c = ctx_get('/job/job1');
    is $c->res->status,'404','存在しないトークンのページへアクセスすると404が返る';
}
{
    my $c = ctx_get('job/job1/edit');
    is $c->res->status,'404','存在しないトークンのeditへアクセスすると404が返る';
}
{
    my $c = ctx_get('job/job1/delete');
    is $c->res->status,'404','存在しないトークンのdeleteへアクセスすると404が返る';
}
done_testing;
