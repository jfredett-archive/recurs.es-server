#
# Cookbook Name:: monit
# Recipe:: default
#
# Copyright 2012, Joseph Fredette
#
# All rights reserved - Do Not Redistribute
#

package 'monit' do
  action [:install, :upgrade]
end

template '/etc/monitrc' do
  source 'monitrc.erb'
  action [:create_if_missing]
end

directory '/etc/monit.d' do
  action [:create]
end

service 'monit' do
  service_name 'monitd'
  action [:enable, :restart]
  supports [:start, :restart, :stop]
end