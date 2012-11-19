#
# Cookbook Name:: base_directories
# Recipe:: default
#
# Copyright 2012, Joe Fredette
#
# All rights reserved - Do Not Redistribute
#

group 'pids'
group 'sites'
group 'logs'

directory('/var/pids/') do
  action :create
  owner 'root'
  group 'pids'
  mode '664'
end

directory('/var/logs/') do
  action :create
  owner 'root'
  group 'logs'
  mode '664'
end

directory('/srv/www/') do
  action :create
  group 'sites'
  mode '775'
end
