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
