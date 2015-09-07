action :return_publickey do
 homedir = "#{new_resource.homedir}"
 contents = ::IO.read("#{homedir}/.ssh/id_rsa.pub")
 Chef::Log.info "Public key read is: #{contents}"
 node.default[:hopsbench][:master][:public_key] = "#{contents}"

 recipeName = "#{__FILE__}".gsub(/.*\//, "")
 recipeName = "#{recipeName}".gsub(/\.rb/, "")

 Chef::Log.info "Recipe name is #{recipeName}"

  template "#{homedir}/.ssh/config" do
    source "ssh_config.erb"
    owner node[:hopsbench][:user]
    group node[:hopsbench][:group]
    cookbook "ndb"
    mode 0664
  end
 
 kagent_param "/tmp" do
   executing_cookbook "hopsbench"
   executing_recipe  "master"
   cookbook "hopsbench"
   recipe "master"
   param "public_key"
   value  node[:hopsbench][:master][:public_key]
 end
end

action :get_publickey do
  homedir = "#{new_resource.homedir}"

  Chef::Log.info "JobMgr public key read is: #{node[:hopsbench][:master][:public_key]}"
  bash "add_jobmgr_public_key" do
    user node[:hopsbench][:user]
    group node[:hopsbench][:group]
    code <<-EOF
      mkdir #{homedir}/.ssh
      echo "#{node[:hopsbench][:master][:public_key]}" >> #{homedir}/.ssh/authorized_keys
      touch #{homedir}/.ssh/.master_key_authorized
  EOF
    not_if { ::File.exists?( "#{homedir}/.ssh/.master_key_authorized" || "#{node[:hopsbench][:master][:public_key]}".empty? ) }
  end
end
