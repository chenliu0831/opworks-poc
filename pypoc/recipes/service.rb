# https://supermarket.chef.io/cookbooks/supervisor
include_recipe 'supervisor'

workdir = "#{node['deploy']['pypoc']['deploy_to']}/current"
logdir = "#{node['pypoc']['supervisor_log_dir']}"

test_length = node['deploy']['pypoc']['environment_variables']['TEST_LENGTH']

supervisor_service 'numpy_app' do
  command "python #{workdir}/app.py"
  action :enable
  autostart false
  autorestart 'unexpected'
  user 'deploy'
  stderr_logfile "#{logdir}/pypoc.stderr.log"
  stdout_logfile "#{logdir}/pypoc.stdout.log"

  environment "PYTHONUNBUFFERED" => node['pypoc']['BUFFER_TIMEOUT'],
              "TEST_LENGTH" => test_length
end