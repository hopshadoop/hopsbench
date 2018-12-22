include_recipe "hopsbench::nmon"

homedir = node['hopsbench']['user'].eql?("root") ? "/root" : "/home/#{node['hopsbench']['user']}"

kagent_keys "#{homedir}" do
  cb_user "#{node['hopsbench']['user']}"
  cb_group "#{node['hopsbench']['group']}"
  cb_name "hopsbench"
  cb_recipe "master"
  action :get_publickey
end
