# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  #root = "http://sourceforge.net/projects/vagrantarchlinx/files/files"
  #date = "2011.08.19"
  #config.vm.box_url = "#{root}/#{date}/archlinux_#{date}.box/download"

  config.vm.box = "arch_linux"

  config.vm.forward_port 80, 10080
  config.vm.forward_port 3000, 13000
  config.vm.forward_port 4000, 14000
  config.vm.forward_port 5000, 15000


  config.vm.provision :chef_solo do |chef|
    chef.node_name = 'recurs.es'

    chef.log_level = 'debug'

    chef.cookbooks_path = 'cookbooks'
    chef.roles_path = 'roles'
    chef.data_bags_path = 'data_bags'

    chef.add_role 'recurses-server'
  end
end
