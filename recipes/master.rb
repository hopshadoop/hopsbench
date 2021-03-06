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

file "#{node['hopsbench']['conf_dir']}/namenodes" do
   owner node['hopsbench']['user']
   action :delete
end

namenodes = node['hops']['nn']['private_ips'].join("\n")
namenodes += "\n"

Chef::Log.info "The contents of the namenodes file: #{namenodes}"

file "#{node['hopsbench']['conf_dir']}/namenodes" do
  owner node['hopsbench']['user']
  group node['hopsbench']['group']
  mode '644'
  content namenodes.to_s
  action :create
end

file "#{node['hopsbench']['conf_dir']}/datanodes" do
   owner node['hopsbench']['user']
   action :delete
end

datanodes = node['hops']['dn']['private_ips'].join("\n")
datanodes += "\n"

Chef::Log.info "The contents of the datanodes file: #{datanodes}"

file "#{node['hopsbench']['conf_dir']}/datanodes" do
  owner node['hopsbench']['user']
  group node['hopsbench']['group']
  mode '644'
  content datanodes.to_s
  action :create
end

file "#{node['hopsbench']['conf_dir']}/experiment-nodes" do
   owner node['hopsbench']['user']
   action :delete
end

slaves = node['hopsbench']['slave']['private_ips'].join("\n")
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

file "#{node['hopsbench']['conf_dir']}/experiment-env.sh" do
  owner node['hopsbench']['user']
  action :delete
end

num_ndbds = node['ndb']['ndbd']['private_ips'].length

template "#{node['hopsbench']['conf_dir']}/experiment-env.sh" do
  source "experiment-env.sh.erb"
  owner node['hopsbench']['user']
  mode "775"
    variables({ 'num_ndbds' => num_ndbds })
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
