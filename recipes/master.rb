
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
