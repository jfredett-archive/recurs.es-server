action :create do
  directory "/srv/app/#{new_resource.name}" do
    group 'apps'
    mode '775'
  end

  new_resource.updated_by_last_action(true)
end



