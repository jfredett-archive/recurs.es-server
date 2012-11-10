action :add do
  group 'rvm' do
    action :modify
    users new_resource.name
    append true
  end
end

action :remove do
  #TODO: This needs to somehow not remove the other guys from the group.
  #probably just need to shell out for this thing
  raise 'not yet implemented'
end
