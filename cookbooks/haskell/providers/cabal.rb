action :install do
  bash "installing #{new_resource.name}" do
    user new_resource.user
    code "cabal install #{new_resource.name} #{new_resource.options.join(' ')}"
  end

  new_resource.updated_by_last_action(true)
end

action :remove do
  bash "uninstalling #{new_resource.name}" do
    user new_resource.user
    code "cabal uninstall #{new_resource.name} #{new_resource.options.join(' ')}"
  end

  new_resource.updated_by_last_action(true)
end

action :reinstall do
  bash "reinstalling #{new_resource.name}" do
    user new_resource.user
    code "cabal reinstall #{new_resource.name} #{new_resource.options.join(' ')}"
  end

  new_resource.updated_by_last_action(true)
end

action :update do
  bash 'updating cabal packagelist' do
    user new_resource.user
    code 'cabal update'
  end

  new_resource.updated_by_last_action(true)
end
