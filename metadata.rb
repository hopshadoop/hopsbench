name             'hopsbench'
maintainer       "hdfs"
maintainer_email "jdowling@kth.se"
license          "Apache v2.0"
description      'Installs/Configures/Runs hopsbench'
version          "0.1"

recipe            "hopsbench::install", "Experiment setup for hopsbench"
recipe            "hopsbench::master",  "configFile=; Experiment name: master"
recipe            "hopsbench::slave",  "configFile=; Experiment name: slave"


depends "kagent"
depends "hops"
depends "hadoop"

%w{ ubuntu debian rhel centos }.each do |os|
  supports os
end

attribute "hopsbench/version",
:description => "Version of hopsbench",
:type => 'string',
:default => "0.1"


attribute "hopsbench/url",
:description => "Url to download binaries for hopsbench",
:type => 'string',
:default => ""

attribute "hopsbench/user",
:description => "Run hopsbench as this user",
:type => 'string'

attribute "hopsbench/group",
:description => "Run hopsbench as this group",
:type => 'string'


