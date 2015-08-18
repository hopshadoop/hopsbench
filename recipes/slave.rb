#private_ip = my_private_ip()
#public_ip = my_public_ip()

script 'run_experiment' do
  cwd "/home/hopsbench"
   user node['hopsbench']['user']
  group node['hopsbench']['group']
  interpreter "bash"
  code <<-EOM

  EOM
end

