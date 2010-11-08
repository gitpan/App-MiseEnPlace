
use strict;
use warnings;

BEGIN { require 5.010; }

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
  'ABSTRACT' => 'A place for everything and everything in its place',
  'AUTHOR' => 'John SJ Anderson <genehack@genehack.org>',
  'BUILD_REQUIRES' => {
    'File::Find' => '0',
    'File::Temp' => '0',
    'Test::More' => '0'
  },
  'CONFIGURE_REQUIRES' => {
    'ExtUtils::MakeMaker' => '6.31'
  },
  'DISTNAME' => 'App-MiseEnPlace',
  'EXE_FILES' => [
    'bin/mise'
  ],
  'LICENSE' => 'perl',
  'NAME' => 'App::MiseEnPlace',
  'PREREQ_PM' => {
    'App::Cmd::Simple' => '0',
    'Carp' => '0',
    'File::Basename' => '0',
    'File::Path' => '0',
    'File::Path::Expand' => '0',
    'FindBin' => '0',
    'Mouse' => '0',
    'Try::Tiny' => '0',
    'YAML' => '0'
  },
  'VERSION' => '0.1',
  'test' => {
    'TESTS' => 't/*.t'
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



