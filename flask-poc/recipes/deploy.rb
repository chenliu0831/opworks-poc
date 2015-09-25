include_recipe 'deploy'

Chef::Log.info('Hello from POC Deploy')

# POC app


node[:deploy].each do |application, deploy|
  opsworks_deploy_dir do
    user deploy[:user]
    group deploy[:group]
    path deploy[:deploy_to]
  end

  opsworks_deploy do
    deploy_data deploy
    app application
  end

  include_recipe 'flask-poc::python_install'
  include_recipe 'flask-poc::service'

  #start the sevice
  notifies :restart, resources(:supervisor_service => 'flask-poc')

end