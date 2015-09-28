# https://supermarket.chef.io/cookbooks/supervisor
include_recipe 'supervisor'

supervisor_service 'flask_app' do
  service_name 'flask_app'
  command "python app.py"
  action :disable
  autostart=false
  autorestart=true
  user 'bodylabs'
  stderr_logfile "#{node['flask_app']['stderr_log_file']}"
  stdout_logfile "#{node['flask_app']['stdout_log_file']}"
end