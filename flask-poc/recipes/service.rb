# https://supermarket.chef.io/cookbooks/supervisor
include_recipe 'supervisor'

supervisor_service 'flask-poc' do
  service_name 'flask-poc'
  command "python app.py"
  action :disable
  autostart=false
  autorestart=true
  user 'bodylabs'
  stderr_logfile "#{node['flask-poc']['stderr_log_file']}"
  stdout_logfile "#{node['flask-poc']['stdout_log_file']}"
end