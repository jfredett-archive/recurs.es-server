#
# Cookbook Name:: nginx
# Recipe:: default
#
# Copyright 2012, Joseph Fredette
#
# All rights reserved - Do Not Redistribute
#

package 'nginx' do
  action [:install]
end

group 'www' do
  action [:create]
end

user 'www-server' do
  action [:create]
  shell '/bin/false'
  gid 'www'
end

template '/etc/nginx/nginx.conf' do
  source 'nginx.conf.erb'
  owner 'www-server'
  group 'www'
  mode 0664
end

