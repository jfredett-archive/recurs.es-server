#
# Cookbook Name:: rvm
# Recipe:: default
#
# Copyright 2012, Joseph Fredette
#
# All rights reserved - Do Not Redistribute
#

RVM_PATH='/usr/local/rvm/bin/rvm'

bash 'install RVM as root' do
  user 'root'
  code 'curl -L https://get.rvm.io | sudo bash ; echo'
  not_if "test -e #{RVM_PATH}"
end

node['rvm']['rubies'].each do |ruby|
  bash "installing #{ruby}" do
    user 'root'
    code "#{RVM_PATH} install #{ruby}"
  end
end
