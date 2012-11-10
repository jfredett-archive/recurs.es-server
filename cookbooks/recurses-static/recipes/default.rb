#
# Cookbook Name:: recurses-static
# Recipe:: default
#
# Copyright 2012, Joe Fredette
#
# All rights reserved - Do Not Redistribute
#

include_recipe "base_directories"
include_recipe "rvm"


rvm_ruby 'rbx' do
  options ['--1.9']
end

rvm_gemset 'recurses-static' do
  ruby 'rbx'
end

deploy site_dir('recurses-static') do
  action :deploy

  repo "git://github.com/jfredett/recurses-static.git"
  revision "HEAD"


  migration_command ""
  migrate false

  symlink_before_migrate.clear
  purge_before_symlink.clear
  create_dirs_before_symlink.clear
  symlinks.clear

  before_migrate do
  end

  restart do
  end
end
