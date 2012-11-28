action :unpack do
  unpacker = case new_resource.format
             when 'tar'
               'tar -xvf'
             when 'tar.gz', 'tgz'
               'tar -zxvf'
             when 'tar.bz', 'tbz'
               'tar -jxvf'
             when 'zip'
               'unzip'
             when 'rar'
               raise 'Unsupported'
             else
               #just assume they gave us the unpacker necessary
               new_resource.format
             end

  tmp_path = "/tmp/#{new_resource.source.object_id}"

  # this should probably do something smarter than #object_id
  remote_file tmp_path do
    user new_resource.user
    source new_resource.source
    owner new_resource.user
    mode '644'
  end

  execute "unpacking with #{unpacker}" do
    user new_resource.user
    command "echo $USER ; #{unpacker} #{tmp_path} -d #{cwd new_resource.name || new_resource.destination}"
  end

  new_resource.updated_by_last_action(true)
end
