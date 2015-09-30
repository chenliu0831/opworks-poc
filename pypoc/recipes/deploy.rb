#
# Cookbook Name:: pypoc
# Recipe:: deploy
#
# Copyright 2015, Bodylabs,Inc
#
# All rights reserved - Do Not Redistribute
#

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

  Chef::Log.info('Installing python dependencies')
  # POC app

  # https://supermarket.chef.io/cookbooks/python
  include_recipe 'python'
  include_recipe 'python::pip'

  current_dir = ::File.join(deploy[:deploy_to], 'current')

  python_pip "-r #{current_dir}/requirements_prod.txt"

  Chef::Log.info('Python dependencies install finished')

  include_recipe 'pypoc::service'

  #restart the sevice
  supervisor_service 'numpy_app' do
    action [:enable, :restart]
  end

end