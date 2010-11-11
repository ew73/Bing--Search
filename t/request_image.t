use Test::More;
use lib qw(lib);
use Data::Dumper;

use_ok( 'Bing::Search::Source::Image' );
my $obj = new_ok( 'Bing::Search::Source::Image' );

ok( $obj->AppId('3'), 'Set the AppId' );
   is( $obj->AppId(), '3', 'Got the right appid?');

ok( $obj->Query('rocks'), 'Looking for rocks.' );
   is( $obj->Query(), 'rocks', 'Still looking for rocks?' );

ok( $obj->Market('en-US'), '..in the US');
   is( $obj->Market(), 'en-US', 'Still in the US.');

ok( $obj->Version('2.0'), 'Version 2.0');
   is( $obj->Version(), '2.0', 'Yup, 2.0.');

ok( $obj->Adult('strict'), 'Strict adults!');
   is( $obj->Adult(), 'strict', 'Draconian measures!');

ok( $obj->setOption('+DisableLocationDetection'), 'Turning on DisableLocationDetection');
   is_deeply( $obj->Options, ['DisableLocationDetection'], 'Seeing if it stuck.');

ok( $obj->setOption('-DisableLocationDetection'), 'Turning it back off.');
   is_deeply( $obj->Options, [], 'Seeing if that stuck, too.');

ok( $obj->Latitude(45), 'Setting the latitude');
   is( $obj->Latitude(), '45', 'Still at 45?');

ok( $obj->Longitude(73), 'Setting the longitude');
   is( $obj->Longitude(), '73', 'Still at 73?');

ok( $obj->Image_Count( 3 ), 'Start at the 3rd item..');
   is( $obj->Image_Count(), '3', 'Still at #3 baby.');

ok( $obj->Image_Offset( 2 ), 'Offset is 2..');
   is( $obj->Image_Offset(), '2', 'Still 2..');


done_testing();
