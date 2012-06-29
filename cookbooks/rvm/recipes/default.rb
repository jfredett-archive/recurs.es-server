#
# Cookbook Name:: rvm
# Recipe:: default
#
# Copyright 2012, Joseph Fredette
#
# All rights reserved - Do Not Redistribute
#

bash 'install RVM as root' do
  user 'root'
  code 'curl -L https://get.rvm.io | sudo bash ; echo'
  #not_if 'test -e /usr/local/rvm/bin/rvm'
end
