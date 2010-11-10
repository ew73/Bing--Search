package Bing::Role::WebRequest::Offset;
use Moose::Role;
use Carp;

requires 'build_request';
requires 'params';
requires 'Web_Count';

has 'Web_Offset' => (
   is => 'rw',
   isa => 'Num',
);

before 'Web_Offset' => sub { 
   my( $self, $param ) = @_;
   unless( $param <= 1000 && $param >= 0 ) { 
      croak "Web.Offset value of $param must be between 0 and 1,000.";      
   }
   if( $self->Web_Count + $param > 1000 ) { 
      croak "The sum of Web.Count and Web.Offset may not exceed 1,000.";
   }
};

before 'build_request' => sub { 
   my $self = shift;
   my $hash = $self->params;
   $hash->{'Web.Count'} = $self->Web_Count;
   $self->params( $hash );
};

1;
