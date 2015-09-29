Chef::Log.info('Hello from POC Setup')

include_recipe 'pypoc::service'

#stop the sevice
supervisor_service 'numpy_app' do
  action [:stop, :disable]
end


