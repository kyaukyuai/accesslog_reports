package Mail;

use warnings;
use strict;
use MIME::Base64 qw(encode_base64 decode_base64);
use constant SENDMAIL => '/usr/sbin/sendmail';
use constant NKF => '/usr/bin/nkf';

our $VERSION = '0.01';

sub new {
  my $class = shift;
  my $self = {
    to => shift,
    from => shift,
    subject => shift,
    text => '',
    charset => 'ISO-2022-JP'
  };

  return bless $self, $class;
}

sub send {
  my $self = shift;

  open (SDML, "|(" . NKF . " -j | " . SENDMAIL . " -t )") or die 'sendmail error';
  print SDML "From: $self->{from}\n";
  print SDML "To: $self->{to}\n";
  print SDML "Subject: $self->{subject}\n";
  print SDML "Content-Transfer-Encoding: 7bit\n";
  print SDML "Content-Type: text/plain; charset=\"$self->{charset}\"\n";
  print SDML "$self->{text}";
  close(SDML);
}

sub set_text {
  my ($self, $text) = @_;
  $self->{text} = $text;
  return 1;
}

1;
