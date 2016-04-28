my $home = Jobeet::Models->get('home');

return {
  database => [
    'dbi:mysql:arktest','root',
    {
      mysql_enable_utf8 => 1,
      on_connect_do => ['SET NAMES utf8'],
    },
  ],
};
