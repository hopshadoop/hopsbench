
ark "hopsbench" do
  url node[:hopsbench][:jar_url]
  version node[:hopsbench][:version]
  #path "#{node[:hopsbench][:home_dir]}"
  home_dir "#{node[:hopsbench][:home_dir]}"
  owner node[:hopsbench][:user]
end


homedir = node[:hopsbench][:user].eql?("root") ? "/root" : "/home/#{node[:hopsbench][:user]}"

hopsbench_keys "#{homedir}" do
  action :get_publickey
end


