include_attribute "hops"
include_attribute "hadoop"


#default[:hopsbench][:url] = "http://snurran.sics.se/hops/deployment-scripts.tgz"
default[:hopsbench][:jar_url] = "http://snurran.sics.se/hops/hopsbench.tgz"
default[:hopsbench][:version] = "0.1"
default[:hopsbench][:user] = node[:hdfs][:user]
default[:hopsbench][:group] = node[:hadoop][:group]

default[:hopsbench][:version_dir] = "/usr/local/hopsbench-#{node[:hopsbench][:version]}"
default[:hopsbench][:home_dir] = "/usr/local/hopsbench"
default[:hopsbench][:conf_dir] = "/usr/local/hopsbench"

