package Date;

use warnings;
use strict;
use Time::Local;

sub new {
  my $class = shift;
  my $self  = {};

  return bless $self, $class;
}

sub get_today {
  my (undef, undef, undef, $day, $mon, $year, undef, undef, undef) = localtime();
  return (sprintf("%04d", $year+1900), sprintf("%02d", $mon+1), sprintf("%02d", $day));
}

1;
