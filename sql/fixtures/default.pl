my @categories   = qw/Design Programming Manager Administrator/;
my @types        = qw/full-time part-time/;
my @programmings = ( 'Web Developer', 'Engineer' );
my @locations    = (
    'Paris, France',
    'Tokyo, Japan',
    'Beijing, China',
    'London, UK',
    'New York, USA'
);

my $prog    = models('Schema::Category')->find( { name => 'Programming' } );
my $design  = models('Schema::Category')->find( { name => 'Design' } );
my $manager = models('Schema::Category')->find( { name => 'Manager' } );
my $admin   = models('Schema::Category')->find( { name => 'Administrator' } );

#create default Categories
for my $category_name (@categories) {
    models('Schema::Category')->create( { name => $category_name } );
}

# create default Jobs
#
my $jobs_rs = models('Schema::Job');

# my $Programming_category = models('Schema::Category')->find({ name => 'Programming'});
$jobs_rs->create(
    {
        category_id => $prog->id,
        type        => 'full-time',
        company     => 'Sensio Labs',
        logo        => 'sensio-labs.gif',
        url         => 'http://www.sensiolabs.com/',
        position    => 'Web Developer',
        location    => 'Paris, France',
        description =>
q[You've already developed websites with symfony and you want to work with Open-Source technologies. You have a minimum of 3 years experience in web development with PHP or Java and you wish to participate to development of Web 2.0 sites using the best frameworks available.],
        how_to_apply => 'Send your resume to fabien.potencier [at] sensio.com',
        is_public    => 1,
        is_activated => 1,
        token        => 'job_sensio_labs',
        email        => 'job@example.com',
        expires_at   => '2010-10-10',
    }
);

# my $design_category = models('Schema::Category')->find({ name => 'Design' });
$jobs_rs->create(
    {
        category_id => $design->id,
        type        => 'part-time',
        company     => 'Extreme Sensio',
        logo        => 'extreme-sensio.gif',
        url         => 'http://www.extreme-sensio.com/',
        position    => 'Web Designer',
        location    => 'Tokyo, Japan',
        description =>
q[Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Utenim ad minim veniam, quis nostrud exercitation ullamco laborisnisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in. Voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpaqui officia deserunt mollit anim id est laborum.],
        how_to_apply => 'Send your resume to fabien.potencier [at] sensio.com',
        is_public    => 1,
        is_activated => 1,
        token        => 'job_extreme_sensio',
        email        => 'job@example.com',

        # expires_at   => '2010-10-10',
    }
);

# my $cat_rs = models('Schema::Category');

# my $cat_programming = models('Schema::Category')->find({name=>'Programming'});
my $job = $jobs_rs->create(
    {
        type         => 'full-time',
        category_id  => $prog->id,
        company      => 'Sensio Labs',
        position     => 'Web Developer',
        location     => 'Beijin, China',
        description  => 'Welcome to our company',
        how_to_apply => 'Send your resume to lorem.ipsum [at] dolor.sit',
        is_public    => 1,
        is_activated => 1,
        token        => 'job_yet1',
        email        => 'job@example.com',
    }
);

# このままだとexpires_atが自動的に30日後になるので
# 意図的にupdateしてexpires_atを過去の日付にする
$job->update(
    {
        created_at => '2016-01-01',
        expires_at => '2016-01-30',
    }
);

# Programming
for my $i ( 100 .. 130 ) {
    my @programmings2 = List::Util::shuffle @programmings;
    my @locations2    = List::Util::shuffle @locations;
    my @t2            = List::Util::shuffle @types;
    my $job           = $jobs_rs->create(
        {
            type         => $t2[0],
            category_id  => $prog->id,
            company      => "Company $i",
            position     => $programmings2[0],
            location     => $locations2[0],
            description  => "Welcome",
            how_to_apply => "Send your resume",
            is_public    => 1,
            is_activated => 1,
            token        => "prog_$i",
            email        => 'job@example.com',
        }
    );
}

# Designer
for my $i ( 100 .. 130 ) {
    my @locations2 = List::Util::shuffle @locations;
    my @t2         = List::Util::shuffle @types;
    my $job        = $jobs_rs->create(
        {
            type         => $t2[0],
            category_id  => $design->id,
            company      => "Company $i",
            position     => "Designer",
            location     => $locations2[0],
            description  => "Welcome",
            how_to_apply => "Send your resume",
            is_public    => 1,
            is_activated => 1,
            token        => "design_$i",
            email        => 'job@example.com',
        }
    );
}

# Manager
for my $i ( 100 .. 130 ) {
    my @locations2 = List::Util::shuffle @locations;
    my @t2         = List::Util::shuffle @types;
    my $job        = $jobs_rs->create(
        {
            type         => $t2[0],
            category_id  => $manager->id,
            company      => "Company $i",
            position     => "Manager",
            location     => $locations2[0],
            description  => "Welcome",
            how_to_apply => "Send your resume",
            is_public    => 1,
            is_activated => 1,
            token        => "manager_$i",
            email        => 'job@example.com',
        }
    );
}

# Administrator
for my $i ( 100 .. 130 ) {
    my @locations2 = List::Util::shuffle @locations;
    my @t2         = List::Util::shuffle @types;
    my $job        = $jobs_rs->create(
        {
            type         => $t2[0],
            category_id  => $admin->id,
            company      => "Company $i",
            position     => "Administrator",
            location     => $locations2[0],
            description  => "Welcome",
            how_to_apply => "Send your resume",
            is_public    => 1,
            is_activated => 1,
            token        => "admin_$i",
            email        => 'job@example.com',
        }
    );
}

1;
