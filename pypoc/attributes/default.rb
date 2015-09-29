# Defaults attributes
default['python']['version'] = '2.7.10'

default['deploy']['pypoc']['user'] = 'bodylabs'
default['deploy']['pypoc']['group'] = 'bodylabs'
default['deploy']['pypoc']['deploy_to'] = '/bodylabs/pypoc'

default['pypoc']['workdir'] = "#{default['deploy']['pypoc']['deploy_to']}/current"
default['supervisor']['log_dir'] = default['pypoc']['log_dir'] = "#{default['pypoc']['workdir']}/log"
default['pypoc']['stderr_log_file'] = "#{default['pypoc']['log_dir']}/pypoc.stderr.log"
default['pypoc']['stdout_log_file'] = "#{default['pypoc']['log_dir']}/pypoc.stdout.log"
