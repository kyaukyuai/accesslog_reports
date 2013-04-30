# t/lib/DateTest.t
use warnings;
use strict;
use Test::More;
use lib "/home/kakuiyuya01/work/reports/lib";

plan (tests => 2);

use_ok("Date");

foreach my $test(
  sub {
    my $date = Date->new();
    can_ok($date, "get_today");
  }
) { $test->(); }
done_testing();

1;
