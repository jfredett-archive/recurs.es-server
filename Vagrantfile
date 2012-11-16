# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  config.package.name = "boxen/arch-linux_#{Time.now.strftime("%Y-%m-%d")}.box"

  config.vm.box = "arch_linux"

  # forward http
  config.vm.forward_port 80, 10080

  # set up memory and CPU assignments
  config.vm.customize ["modifyvm", :id, "--memory", 2048]
  config.vm.customize ["modifyvm", :id, "--cpus", 4]


  config.vm.provision :chef_solo do |chef|
    chef.node_name = 'recurs.es'

    chef.log_level = 'debug'

    chef.cookbooks_path = 'cookbooks'
    chef.roles_path = 'roles'
    chef.data_bags_path = 'data_bags'

    chef.add_role 'recurses-server'
  end
end
