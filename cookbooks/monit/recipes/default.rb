#
# Cookbook Name:: monit
# Recipe:: default
#
# Copyright 2012, Joseph Fredette
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'base_directories'

package 'monit' do
  action [:install, :upgrade]
end

template '/etc/monitrc' do
  source 'monitrc.erb'
  action :create
end

directory '/etc/monit.d' do
  action :create
end

service 'monit' do
  service_name 'monitd'
  action :start
  supports [:start, :restart, :stop]
end
