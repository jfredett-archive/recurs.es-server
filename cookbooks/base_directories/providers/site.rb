action :create do
  directory "/srv/www/#{new_resource.name}" do
    group 'sites'
    mode '775'
  end

  new_resource.updated_by_last_action(true)
end



