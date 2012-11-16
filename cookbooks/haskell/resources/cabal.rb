actions :install, :remove, :reinstall, :update
default_action :install

attribute :user
attribute :options, default: []
