# -*- mode: ruby -*-
# vi: set ft=ruby :

# This Vagrantfile configuration emulates the AWS OpsWorks example project found
# in their "Getting Started" guide:
# http://docs.aws.amazon.com/opsworks/latest/userguide/gettingstarted-db.html

Vagrant.configure("2") do |config|

  config.vm.box = "ubuntu1404-opsworks"

  config.vm.define "pypoc" do |layer|

    layer.vm.provision "opsworks", type:"shell", run: "always", args:[
      'stack.json',
      'pypoc/app.json'
    ]

    # Forward port 80 so we can see our work
    layer.vm.network "forwarded_port", guest: 80, host: 8080
    layer.vm.network "private_network", ip: "10.10.10.10"
  end

end