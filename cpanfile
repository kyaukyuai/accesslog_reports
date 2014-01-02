requires 'FindBin::libs';
requires 'Project::Libs';

on 'test' => sub {
    requires 'Test::More';
    requires 'Devel::Cover';
    requires 'TAP::Formatter::JUnit';
    requires 'Test::Name::FromLine';
};

on 'develop' => sub {
    requires 'Module::Install';
    requires 'Module::Install::CPANfile';
    requires 'Module::Install::AuthorTests';
    requires 'Module::Install::Repository';
    requires 'Module::Install::ReadmeFromPod';
};
