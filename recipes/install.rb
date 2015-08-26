directory node[:hopsbench][:home_dir] do
  owner node[:hopsbench][:user]
  group node[:hopsbench][:group]
  mode "755"
  action :create
  recursive true
end


ark "deployment-scripts" do
  url node[:hopsbench][:url]
  version node[:hopsbench][:version]
  path "#{node[:hopsbench][:home_dir]}"
  home_dir "#{node[:hopsbench][:home_dir]}/deployment-scripts"
  owner node[:hopsbench][:user]
end


ark "hopsbench" do
  url node[:hopsbench][:jar_url]
  version node[:hopsbench][:version]
  path "#{node[:hopsbench][:home_dir]}"
  home_dir "#{node[:hopsbench][:home_dir]}/hopsbench"
  owner node[:hopsbench][:user]
end

