# https://supermarket.chef.io/cookbooks/supervisor
include_recipe 'supervisor'

supervisor_service 'numpy_app' do
  command "python #{node['pypoc']['workdir']}/app.py"
  action :enable
  autostart false
  autorestart 'unexpected'
  user 'bodylabs'
  stderr_logfile "#{node['pypoc']['stderr_log_file']}"
  stdout_logfile "#{node['pypoc']['stdout_log_file']}"
end