action :do do
  rvm_string = "#{new_resource.ruby}@#{new_resource.gemset}"

  bash 'executing command' do
    user 'rvm'
    code "/usr/local/rvm/bin/rvmsudo /usr/local/rvm/bin/rvm #{rvm_string} do #{new_resource.code}"
  end
end

