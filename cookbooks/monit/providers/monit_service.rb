action :create do
  service new_resource.name do
    action (new_resource.service_actions || :enable)
    supports new_resource.service_supports
  end

  directory '/var/pids/' do
    owner 'root'
    group 'root'
    mode '755'
    action :create
  end

  template "/etc/monit.d/#{params[:name]}.monit" do
    source "monit_service.erb"
    variables new_resource.variables.merge({ :name => new_resource.name })
  end

  new_resource.updated_by_last_action true
end

action :delete do
  monitfile = "/etc/monit.d/#{new_resource.name}.monit"
  only_if { File.exists?(monitfile) }
  command "rm #{monitfile}"
end
