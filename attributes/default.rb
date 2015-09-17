include_attribute "apache_hadoop"

default['hopsbench']['url'] = "#{node['download_url']}/hopsbench-apache-#{node['apache_hadoop']['version']}.tgz"
default['hopsbench']['version'] = "0.1"
default['hopsbench']['user'] = node['apache_hadoop']['hdfs']['user']
default['hopsbench']['group'] = node['apache_hadoop']['group']

default['hopsbench']['base_dir'] = node['install']['dir'].empty? ? "/srv" : node['install']['dir']
default['hopsbench']['home_dir'] = "#{default['hopsbench']['base_dir']}/hopsbench"
default['hopsbench']['version_dir'] = "#{default['hopsbench']['base_dir']}-#{node['hopsbench']['version']}"
default['hopsbench']['conf_dir'] = "#{node['hopsbench']['home_dir']}/scripts"
