include_attribute "hops"
include_attribute "hadoop"

default['hopsbench']['jar_url'] = "http://snurran.sics.se/hops/hopsbench.tgz"
default['hopsbench']['version'] = "0.1"
default['hopsbench']['user'] = node['hops']['hdfs']['user']
default['hopsbench']['group'] = node['hops']['group']

default['hopsbench']['base_dir'] = node['install']['dir'].empty? ? "/srv" : node['install']['dir']
default['hopsbench']['home_dir'] = "#{default['hopsbench']['base_dir']}/hopsbench"
default['hopsbench']['version_dir'] = "#{default['hopsbench']['base_dir']}-#{node['hopsbench']['version']}"
default['hopsbench']['conf_dir'] = "#{node['hopsbench']['home_dir']}/scripts"
