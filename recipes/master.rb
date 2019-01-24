include_recipe "hopsbench::nmon"

ark "hopsbench" do
  url node['hopsbench']['url']
  version node['hopsbench']['version']
  home_dir "#{node['hopsbench']['home_dir']}"
  owner node['hopsbench']['user']
end

package "pssh" do
  action :install
end

package "tmux" do
  action :install
end

package "bc" do
  action :install
end

package "attr" do
  action :install
end

file "#{node['hopsbench']['conf_dir']}/osd-nodes" do
   owner node['hopsbench']['user']
   action :delete
end

osdnodes = node['hopsbench']['osd']['private_ips'].map { |e| node['hopsbench']['osd']['hosts'][e]}.join("\n")
osdnodes += "\n"


file "#{node['hopsbench']['conf_dir']}/osd-nodes" do
  owner node['hopsbench']['user']
  group node['hopsbench']['group']
  mode '644'
  content osdnodes.to_s
  action :create
end

file "#{node['hopsbench']['conf_dir']}/mds-nodes" do
   owner node['hopsbench']['user']
   action :delete
end

mdsnodes = node['hopsbench']['mds']['private_ips'].map { |e| node['hopsbench']['mds']['hosts'][e]}.join("\n")
mdsnodes += "\n"


file "#{node['hopsbench']['conf_dir']}/mds-nodes" do
  owner node['hopsbench']['user']
  group node['hopsbench']['group']
  mode '644'
  content mdsnodes.to_s
  action :create
end

file "#{node['hopsbench']['conf_dir']}/namenodes" do
   owner node['hopsbench']['user']
   action :delete
end

file "#{node['hopsbench']['conf_dir']}/mon-nodes" do
   owner node['hopsbench']['user']
   action :delete
end

monnodes = node['hopsbench']['mon']['private_ips'].map { |e| node['hopsbench']['mon']['hosts'][e]}.join("\n")
monnodes += "\n"


file "#{node['hopsbench']['conf_dir']}/mon-nodes" do
  owner node['hopsbench']['user']
  group node['hopsbench']['group']
  mode '644'
  content monnodes.to_s
  action :create
end

file "#{node['hopsbench']['conf_dir']}/namenodes" do
  owner node['hopsbench']['user']
  group node['hopsbench']['group']
  mode '644'
  content monnodes.to_s
  action :create
end

file "#{node['hopsbench']['conf_dir']}/experiment-nodes" do
   owner node['hopsbench']['user']
   action :delete
end

slaves = node['hopsbench']['slave']['private_ips'].map { |e| node['hopsbench']['slave']['hosts'][e]}.join("\n")
slaves += "\n"

Chef::Log.info "The contents of the slaves file: #{slaves}"

file "#{node['hopsbench']['conf_dir']}/experiment-nodes" do
  owner node['hopsbench']['user']
  group node['hopsbench']['group']
  mode '644'
  content slaves.to_s
  action :create
end

homedir = node['hopsbench']['user'].eql?("root") ? "/root" : "/home/#{node['hopsbench']['user']}"
Chef::Log.info "Home dir is #{homedir}. Generating ssh keys..."

kagent_keys "#{homedir}" do
  cb_user node['hopsbench']['user']
  cb_group node['hopsbench']['group']
  action :generate
end

kagent_keys "#{homedir}" do
  cb_user node['hopsbench']['user']
  cb_group node['hopsbench']['group']
  cb_name "hopsbench"
  cb_recipe "master"
  action :return_publickey
end

file "#{homedir}/.tmux.conf" do
  owner node['hopsbench']['user']
  action :delete
end

template "#{homedir}/.tmux.conf" do
  source "tmux.conf.erb"
  owner node['hopsbench']['user']
  mode "775"
end
