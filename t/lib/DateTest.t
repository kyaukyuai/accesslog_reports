# t/lib/DateTest.t
use warnings;
use strict;
use Test::More;
use lib "/home/kakuiyuya01/work/reports/lib";

plan (tests => 12);

use_ok("Date");

foreach my $test(
  sub {
    my $date = Date->new();
    can_ok($date, "get_today");
    can_ok($date, "get_tomorrow");
    can_ok($date, "get_yesterday");
    can_ok($date, "get_date");
    my ($YYYY, $MM, $DD) = 0;
    # get_today()
    ($YYYY, $MM, $DD) = $date->get_today();
    like("$YYYY$MM$DD", qr/\d{8}/, "this date should be YYYYMMDD");
    # get_yesterday()
    ($YYYY, $MM, $DD) = $date->get_yesterday();
    like("$YYYY$MM$DD", qr/\d{8}/, "this date should be YYYYMMDD");
    # get_tomorrow()
    ($YYYY, $MM, $DD) = $date->get_tomorrow();
    like("$YYYY$MM$DD", qr/\d{8}/, "this date should be YYYYMMDD");
    # get_date
    ($YYYY, $MM, $DD) = $date->get_date(-1);
    like("$YYYY$MM$DD", qr/\d{8}/, "this date should be YYYYMMDD");
    is($date->get_date(-1), $date->get_yesterday(), "check yesterday date");
    is($date->get_date(), $date->get_today(), "check today date");
    is($date->get_date(+1), $date->get_tomorrow(), "check tomorrow date");
  }
) { $test->(); }
done_testing();

1;
