Chef::Log.info('Installing python dependencies')

# POC app

# https://supermarket.chef.io/cookbooks/python
include_recipe 'python'
include_recipe 'python::pip'

python_pip "#{node['flask']['package_location']}"

Chef::Log.info('Python dependencies install finished')