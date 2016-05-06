package Jobeet::Controller::Job;
use Ark 'Controller';
with 'Ark::ActionClass::Form';

use Jobeet::Models;
# use Data::Dumper;

sub index :Path {
    my ($self, $c) = @_;
    $c->stash->{categories} = models('Schema::Category')->get_with_jobs;
}

# /job/{job_token}(詳細)
# Pathに何も指定しないとパッケージのルートになる--> job
sub show :Path :Args(1) {
  my ($self, $c, $job_token) = @_;
  $c->stash->{job} = models('Schema::Job')->find({ token => $job_token})
    or $c->detach('/default');
}

# /job/create(新規作成)
sub create :Local :Form('Jobeet::Form::Job'){
  my ($self,$c) = @_;
  if($c->req->method eq 'POST' and $self->form->submitted_and_valid){
    # バリデーション成功、求人を募集する
    my $job = models('Schema::Job')->create_from_form($self->form);
    # フォームの内容をテーブルに追加
    $c->redirect($c->uri_for('/job',$job->token));# /job/{token}というurlにリダイレクト
  }
}

# ここで一回job_token=${job_token}の内容を取得
sub job :Chained('/') :PathPart :CaptureArgs(1) {
  my ($self, $c, $job_token) = @_;

    $c->stash->{job} = models('Schema::Job')->find({ token => $job_token })
        or $c->detach('/default');
  # $c->stash->{job_token} = $job_token;
}

# /job/{job_token}/edit (編集)
sub edit :Chained('job') :PathPart :Form('Jobeet::Form::Job') {
  my ($self, $c) = @_;

    my $job = $c->stash->{job};

    if ($c->req->method eq 'POST') {
        # print "edit------------------\n";
        if ($self->form->submitted_and_valid) {
            $job->update_from_form($self->form);
            $c->redirect( $c->uri_for('/job', $job->token) );
        }
    }
    else {
        $self->form->fill({
            $job->get_columns,
            category => $job->category->slug,# designとかprogrammingとかの文字列
        });
    }
}

sub publish :Chained('job') :PathPart {
  my ($self,$c) = @_;
  my $job = $c->stash->{job};
  $job->publish;
  $c->redirect($c->uri_for('/job',$job->token));
}

# /job/{job_token}/delete (削除)
sub delete :Chained('job') :PathPart :Args(0) {
  my ($self,$c) = @_;

  $c->stash->{job}->delete;
  $c->redirect($c->uri_for('/job'));
}

1;
