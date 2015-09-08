
homedir = node[:hopsbench][:user].eql?("root") ? "/root" : "/home/#{node[:hopsbench][:user]}"

hopsbench_keys "#{homedir}" do
  action :get_publickey
end

