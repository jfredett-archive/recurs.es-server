#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2012, Joseph Fredette
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'monit'

package 'nginx' do
  action [:install]
end

group 'www' do
  action :create
end

directory '/var/pids' do
  action :create
end

directory '/var/logs' do
  action :create
end

user 'www-server' do
  action :create
  shell '/bin/false'
  gid 'www'
end

template '/etc/nginx/nginx.conf' do
  source 'nginx.conf.erb'
  owner 'www-server'
  group 'www'
  mode 0664
end

monit_service 'nginx' do
  service_action :start
  service_supports [:enable, :start, :stop]
  variables({
    :start_command => '/etc/rc.d/nginx start',
    :stop_command => '/etc/rc.d/nginx stop',
    :script => ''
  })
end
