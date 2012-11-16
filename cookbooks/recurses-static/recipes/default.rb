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

package 'python'

rvm_ruby '1.9.3'
rvm_gemset 'recurses-static' do
  ruby '1.9.3'
end


deploy site_dir('recurses-static') do
  action :deploy

  repo "git://github.com/jfredett/recurses-static.git"
  revision "HEAD"

  migration_command do
  end
  migrate false

  symlink_before_migrate.clear
  purge_before_symlink.clear
  create_dirs_before_symlink.clear
  symlinks.clear

  before_migrate do
    rvm_execute 'bundle install' do

      ruby '1.9.3'
      gemset 'recurses-static'
      code <<-CODE
        bundle --gemfile /srv/www/recurses-static/current/Gemfile
      CODE
    end

    rvm_execute 'generate site' do
      ruby '1.9.3'
      gemset 'recurses-static'
      code "bundle --gemfile /srv/www/recurses-static/current/Gemfile exec rake generate"
    end
  end

  restart do
  end
end
