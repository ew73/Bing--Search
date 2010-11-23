package Bing::Search::Result;
use Moose;

with 'Bing::Search::Role::Types::UrlType';

has 'data' => ( 
   is => 'rw',
   builder => '_populate'
#   trigger => \&_populate
);

sub _populate { 
   # nothing here but us chickens
}

__PACKAGE__->meta->make_immutable;
