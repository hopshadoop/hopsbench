directory node[:hopsbench][:home_dir] do
  owner node[:hopsbench][:user]
  group node[:hopsbench][:group]
  mode "755"
  action :create
  recursive true
end


# ark "deployment-scripts" do
#   url node[:hopsbench][:url]
#   version node[:hopsbench][:version]
#   path "#{node[:hopsbench][:home_dir]}"
#   home_dir "#{node[:hopsbench][:home_dir]}/deployment-scripts"
#   owner node[:hopsbench][:user]
# end


ark "hopsbench" do
  url node[:hopsbench][:jar_url]
#  version node[:hopsbench][:version]
  path "#{node[:hopsbench][:home_dir]}"
#  home_dir "#{node[:hopsbench][:home_dir]}/hopsbench"
  owner node[:hopsbench][:user]
end


package "pssh" do
  action :install
end


file "#{node[:hopsbench][:conf_dir]}/namenodes" do
   owner node[:hopsbench][:user]
   action :delete
end

namenodes = node[:hops][:nn][:private_ips].join("\n")
namenodes += "\n"

Chef::Log.info "The contents of the namenodes file: #{namenodes}"

file "#{node[:hopsbench][:conf_dir]}/namenodes" do
  owner node[:hopsbench][:user]
  group node[:hopsbench][:group]
  mode '644'
  content namenodes.to_s
  action :create
end


file "#{node[:hopsbench][:conf_dir]}/slaves" do
   owner node[:hopsbench][:user]
   action :delete
end

slaves = node[:hopsbench][:slave][:private_ips].join("\n")
slaves += "\n"

Chef::Log.info "The contents of the slaves file: #{slaves}"

file "#{node[:hopsbench][:conf_dir]}/slaves" do
  owner node[:hopsbench][:user]
  group node[:hopsbench][:group]
  mode '644'
  content slaves.to_s
  action :create
end


file "#{node[:hopsbench][:conf_dir]}/namenodes" do
   owner node[:hopsbench][:user]
   action :delete
end

nns = node[:hops][:nn][:private_ips].join("\n")
nns += "\n"

file "#{node[:hopsbench][:conf_dir]}/namenodes" do
  owner node[:hopsbench][:user]
  group node[:hopsbench][:group]
  mode '644'
  content nns.to_s
  action :create
end

homedir = node[:hopsbench][:user].eql?("root") ? "/root" : "/home/#{node[:hopsbench][:user]}"

bash "generate-ssh-keypair-for-master" do
 user node[:hopsbench][:user]
  code <<-EOF
     ssh-keygen -b 2048 -f #{homedir}/.ssh/id_rsa -t rsa -q -N ''
  EOF
 not_if { ::File.exists?( "#{homedir}/.ssh/id_rsa" ) }
end

hopsbench_keys "#{homedir}" do
  action :return_publickey
end


file "#{node[:hopsbench][:conf_dir]}/sbin/environment-env.sh" do 
  owner node[:hopsbench][:user]
  action :delete
end

template "#{node[:hopsbench][:conf_dir]}/sbin/environment-env.sh" do
  source "environment-env.sh.erb"
  owner node[:hopsbench][:user]
  mode "775"
end
