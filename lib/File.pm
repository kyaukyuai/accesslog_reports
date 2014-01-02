package File;

use warnings;
use strict;
use Logger;

our $VERSION = '0.01';

sub new {
  my $class = shift;
  my $self = {};
  return bless $self, $class;
}

sub read {
  my ($self, $file) = @_;
  open (FILE, $file) or die Logger->error("$!");
  while (<FILE>) {
  }
  close (FILE);
}

1;
