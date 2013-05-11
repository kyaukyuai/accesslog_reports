#!/home/kakuiyuya01/perl5/perlbrew/perls/perl-5.16.3/bin/perl
use warnings;
use strict;
use lib "/home/kakuiyuya01/work/reports/lib";
use Date;
use Mail;
use Logger;

# crete new logger
my $logger = new Logger();

# get report date
my ($YYYY, $MM, $DD) = Date->get_yesterday();

# set mail config
my $accesslog = "/var/log/httpd/access_log-$YYYY$MM$DD";
my $sendmail  = "";
my $from      = "y.kakui\@gmail.com";
my $to        = "y.kakui\@gmail.com";
my $subject   = "[Report] accesslog.$YYYY$MM$DD";

# report accesslog
$logger->info("Start Calculating $accesslog");
my $accessCount = 0;
if (-e $accesslog) {
  open (LOG, $accesslog) or die $logger->error("$!");
  while(<LOG>) {
    $accessCount ++;
  }
  close (LOG);
} else {
  # accesslog is not exitst
  $logger->info("$accesslog is NOT EXIST!!!");
  exit(1);
}
$logger->info("Finished Calculating $accesslog");

my $msg =
<< "_TEXT_";
accessCount = $accessCount
_TEXT_

# send mail
$logger->info("Start send mail");
my $mail = new Mail($to, $from, $subject);
$mail->set_text($msg);
$mail->send();
$logger->info("Finished send mail");

1;
