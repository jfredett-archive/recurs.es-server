action :create do
  directory "/var/logs/#{new_resource.name}" do
    action :create
  end

  new_resource.updated_by_last_action(true)
end



