#
# Cookbook Name:: base_directories
# Recipe:: default
#
# Copyright 2012, Joe Fredette
#
# All rights reserved - Do Not Redistribute
#

directory('/var/pids/') { action :create }
directory('/var/logs/') { action :create }
directory('/srv/www/') { action :create }
