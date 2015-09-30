Chef::Log.info('Hello from POC Setup')

execute 'stop all supervisord' do
  only_if { ::File.exists?("/etc/supervisord.conf") }
  command 'sudo supervisorctl stop all'
end

# create directory
execute 'create log directory for supervisor' do
  not_if { ::Dir.exists?("#{node['pypoc']['supervisor_log_dir']}") }
  command "sudo mkdir #{node['pypoc']['supervisor_log_dir']}"
end
