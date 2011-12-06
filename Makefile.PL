
use strict;
use warnings;



use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "Interface to a glucosebuddy.com account",
  "AUTHOR" => "Pete Smith <pete\@cubabit.net>",
  "BUILD_REQUIRES" => {
    "Test::MockObject" => "1.20110612",
    "Test::More" => "0.98",
    "URI" => "1.59",
    "strict" => 0,
    "warnings" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "WebService-GlucoseBuddy",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "WebService::GlucoseBuddy",
  "PREREQ_PM" => {
    "Carp" => "1.20",
    "DateTime::Format::Strptime" => "1.5",
    "Moose" => "1.24",
    "MooseX::Iterator" => "0.11",
    "Readonly" => "1.03",
    "Text::CSV" => "1.21",
    "WWW::Mechanize" => "1.70",
    "namespace::autoclean" => "0.13"
  },
  "VERSION" => "1.113400",
  "test" => {
    "TESTS" => "t/*.t"
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



