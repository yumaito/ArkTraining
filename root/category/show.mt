? my $category = $c->stash->{category};
? my $jobs     = $c->stash->{jobs};
? my $pager    = $jobs->pager;

? extends 'common/jobs_base';

? block title => sub { sprintf 'Jobs in the %s category', $category->name };

? block content => sub {
<div class="category">
  <div class="feed">
    <a href="">Feed</a>
  </div>
  <h1><?= $category->name ?></h1>
</div>

?= include('job/_partial_jobs', $jobs->all);

? if ($pager->last_page > 1) {
  <div class="pagination">
    <a href="<?= $c->req->uri_with({ page => $pager->first_page }) ?>">
      <img src="/images/first.png" alt="<?= x('First page') ?>" />
    </a>

? if ($pager->previous_page) {
    <a href="<?= $c->req->uri_with({ page => $pager->previous_page }) ?>">
      <img src="/images/previous.png" alt="<?= x('Previous page') ?>" title="<?= x('Previous page') ?>" />
    </a>
? } else {
      <img src="/images/previous.png" alt="<?= x('Previous page') ?>" title="<?= x('Previous page') ?>" />
? }

? for my $p ($pager->pages_in_navigation) {
?     if ($p == $pager->current_page) {
          <?= $p ?>
?     } else {
          <a href="<?= $c->req->uri_with({ page => $p }) ?>"><?= $p ?></a>
?     }
? }

? if ($pager->next_page) {
    <a href="<?= $c->req->uri_with({ page => $pager->next_page }) ?>">
      <img src="/images/next.png" alt="x('Next page')" title="x('Next page')" />
    </a>
? } else {
      <img src="/images/next.png" alt="x('Next page')" title="x('Next page')" />
? }

    <a href="<?= $c->req->uri_with({ page => $pager->last_page }) ?>">
      <img src="/images/last.png" alt="x('Last page')" title="x('Last page')" />
    </a>
  </div>
? } # endif

<div class="pagination_desc">
  <strong><?= $pager->total_entries ?></strong> <?= x('jobs in this category') ?>

? if ($pager->last_page > 1) {
    - <?= x('page') ?> <strong><?= $pager->current_page ?>/<?= $pager->last_page ?></strong>
? }
</div>

? } # endblock content
