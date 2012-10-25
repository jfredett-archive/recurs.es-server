action :create do
  service new_resource.name do
    action (new_resource.service_action || :enable)
    supports new_resource.service_supports
    notifies :restart, 'service[monit]'
  end

  template "/etc/monit.d/#{new_resource.name}.monit" do
    source "monit_service.erb"
    cookbook 'monit'
    variables new_resource.variables.merge({ :name => new_resource.name })
  end

  new_resource.updated_by_last_action(true)
end

action :delete do
  monitfile = "/etc/monit.d/#{new_resource.name}.monit"
  only_if { File.exists?(monitfile) }
  command "rm #{monitfile}"
end
