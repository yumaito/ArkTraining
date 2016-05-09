? my $form = $c->stash->{form};
? my $job = $c->stash->{job};

? extends 'common/jobs_base';

? block content => sub {

<div id="job_actions">
  <h3>x('Admin')</h3>
  <ul>
? if (!$job->is_activated) {
      <li><a href="<?= $c->uri_for('/job', $job->token, 'edit') ?>">x('Edit')</a></li>
      <li><a href="<?= $c->uri_for('/job', $job->token, 'publish') ?>">x('Publish')</a></li>
? }
    <li><a href="<?= $c->uri_for('/job', $job->token, 'delete') ?>" onclick="return confirm('Are you sure?')">x('Delete')</a></li>

? if ($job->is_activated) {
    <li<?= $job->expires_soon ? ' class="expires_soon"' : '' ?>>
? if ($job->is_expired) {
          x('Expired')
? } else {
          x('Expires in ')<strong><?= $job->days_before_expired ?></strong> x('days')
? }

? if ($job->expires_soon) {
         - <a href="">x('Extend')</a> x('for another') <?= Jobeet::Models->get('conf')->{active_days} ?> x('days')
? }
      </li>
? } else {
      <li>
        [x('Bookmark this ')<a href="<?= $c->req->uri ?>">URL</a> x('to manage this job in the future.')]
      </li>
? }
  </ul>
</div>

<h1>
x('Edit Job')
</h1>
?= include('job/_partial_form', $form);

? } # endblock content
