use strict;
use warnings;
use Test::Easy;

use IO::File::String;

TEST 'module use',
CODE {
 return 1;
}
;

RUN;

exit;
__END__
