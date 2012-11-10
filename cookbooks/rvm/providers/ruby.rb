action :install do
  bash "installing #{new_resource.name}" do
    user 'rvm'
    code "/usr/local/rvm/bin/rvmsudo /usr/local/rvm/bin/rvm install #{new_resource.name} #{new_resource.options.join(' ')}"
  end

  new_resource.global_gems.each do |gem|
    rvm_execute "installing global gem: #{gem}" do
      ruby new_resource.name
      gemset 'global'

      code "gem install #{gem}"
    end
  end

  new_resource.updated_by_last_action(true)
end

action :remove do
  bash "uninstalling #{new_resource.name}" do
    user 'rvm'
    code "/usr/local/rvm/bin/rvmsudo /usr/local/rvm/bin/rvm uninstall #{new_resource.name} #{new_resource.options.join(' ')}"
  end

  new_resource.updated_by_last_action(true)
end

action :reinstall do
  bash "reinstalling #{new_resource.name}" do
    user 'rvm'
    code "/usr/local/rvm/bin/rvmsudo /usr/local/rvm/bin/rvm reinstall #{new_resource.name} #{new_resource.options.join(' ')}"
  end

  new_resource.updated_by_last_action(true)
end
