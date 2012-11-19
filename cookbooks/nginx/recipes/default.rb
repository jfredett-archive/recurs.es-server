#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2012, Joseph Fredette
#
# All rights reserved - Do Not Redistribute
#

include_recipe 'base_directories'
include_recipe 'monit'

package 'nginx' do
  action [:install]
end

group 'www'
user 'www-server' do
  action :create
  shell '/bin/false'
  gid 'www'
end

log_dir 'nginx/'

directory '/etc/nginx/sites/' do
  action :create

  owner 'www-server'
  group 'www'
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
    :stop_command  => '/etc/rc.d/nginx stop',
    :script        => %Q{
      group www
      if children > 250 then restart
      if loadavg(5min) greater than 10 for 10 cycles then restart
      if 3 restarts within 5 cycles then timeout
    }
  })
end
