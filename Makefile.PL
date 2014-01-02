use strict;
use inc::Module::Install;

name 'AccessLogReport';
license 'perl';
all_from 'lib/Date.pm';
all_from 'lib/File.pm';
all_from 'lib/Logger.pm';
all_from 'lib/Mail.pm';
auto_set_repository;
auto_provides;
cpanfile;
WriteAll;
