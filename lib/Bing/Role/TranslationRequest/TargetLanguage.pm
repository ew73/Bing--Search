package Bing::Role::TranslationRequest::TargetLanguage;
use Moose::Role;
use Carp;

requires 'build_request';
requires 'params';
requires '_translation_langauge_list';

has 'Translation_TargetLangauge' => (
   is => 'rw',
   lazy_build => 1
);

sub _build_Translation_TargetLanguage { } 

before 'Translation_TargetLanguage' => sub { 
   my $self = shift;
   my ($param) = @_;
   my $langs = $self->_translation_language_list;
   unless( $param && exists $langs->{$param} ) { 
      croak "Unknown source langauge $param";
   }

};

before 'build_request' => sub { 
   my $self = shift;
   if( $self->has_Translation_TargetLangauge ) { 
      my $hash = $self->params;
      $hash->{'Translation.TargetLanguage'} = $self->Translation_TargetLanguage;
      $self->params( $hash );
   }
};

1;