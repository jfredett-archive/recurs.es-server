action :create do
  directory "/srv/www/#{new_resource.name}" do
    action :create
  end

  new_resource.updated_by_last_action(true)
end



