# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant::Config.run do |config|
  # Every Vagrant virtual environment requires a box to build off of.
  root = "http://sourceforge.net/projects/vagrantarchlinx/files/files"
  date = "2011.08.19"

  config.vm.box = "archlinux"
  config.vm.box_url = "#{root}/#{date}/archlinux_#{date}.box/download"


  config.vm.provision :chef_solo do |chef|
    chef.cookbooks_path = "cookbooks"
    chef.roles_path = "roles"
    chef.add_role "recurses-server"
  end
end
