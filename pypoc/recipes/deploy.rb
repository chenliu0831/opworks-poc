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

  python_pip "#{node['flask_app']['package_location']}"

  Chef::Log.info('Python dependencies install finished')

  execute "pip-freeze" do
    command "pip freeze"
    action :run
  end

  include_recipe 'supervisor'
  include_recipe 'pypoc::service'

  #restart the sevice
  notifies :restart, "supervisor_service[flask_app]"

end