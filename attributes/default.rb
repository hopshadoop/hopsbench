default['hopsbench']['url'] = "#{node['download_url']}/hopsbench-cephfs.tgz"
default['hopsbench']['version'] = "0.1"
default['hopsbench']['user'] = "ubuntu"
default['hopsbench']['group'] = "ubuntu"

default['hopsbench']['base_dir'] = "/srv"
default['hopsbench']['home_dir'] = "#{default['hopsbench']['base_dir']}/hopsbench"
default['hopsbench']['version_dir'] = "#{default['hopsbench']['base_dir']}-#{node['hopsbench']['version']}"
default['hopsbench']['conf_dir'] = "#{node['hopsbench']['home_dir']}/scripts"
