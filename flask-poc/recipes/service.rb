# https://supermarket.chef.io/cookbooks/supervisor
include_recipe 'supervisor'

supervisor_service 'flask' do
  service_name 'flask'
  command "python app.py"
  action :disable
  autostart=false
  autorestart=true
  user 'bodylabs'
  stderr_logfile "#{node['flask']['stderr_log_file']}"
  stdout_logfile "#{node['flask']['stdout_log_file']}"
end