action :create do
  directory "/var/logs/#{new_resource.name}" do
    group 'logs'
    mode '664'
  end

  new_resource.updated_by_last_action(true)
end



