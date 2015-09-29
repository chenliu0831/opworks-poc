# Defaults attributes
default['python']['version'] = '2.7.10'

default['deploy']['flask_app']['deploy_to'] = '/bodylabs/poc'
default['flask_app']['package_location'] = "#{default['deploy']['flask_app']['deploy_to']}/requirements_prod.txt"
default['flask_app']['stderr_log_file'] = '/bodylabs/logs/flask_app.stderr.log'
default['flask_app']['stdout_log_file'] = '/bodylabs/logs/flask_app.stdout.log'

default['flask_app']['revision'] = 'master'
