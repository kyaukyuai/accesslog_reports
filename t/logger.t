# t/lib/LoggerTest.t
use warnings;
use strict;
use Test::More;
use lib "/home/kakuiyuya01/work/reports/lib";

plan (tests => 1);

use_ok("Logger");

foreach my $test(
  sub {
    my $logger = Logger->new();
    $logger->info("test info");
    $logger->error("test error");
  }
) { $test->(); }
done_testing();

1;
