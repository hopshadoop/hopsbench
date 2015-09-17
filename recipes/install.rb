include_recipe "java"

group node['hopsbench']['group'] do
  action :create
  not_if "getent group #{node['hopsbench']['group']}"
end

user node['hopsbench']['user'] do
  home "/home/#{node['hopsbench']['user']}"
  system true
  shell "/bin/bash"
  manage_home true
  action :create
  not_if "getent passwd #{node['hopsbench']['user']}"
end
