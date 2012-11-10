action :create do
  bash 'executing command' do
    user 'rvm'
    code "/usr/local/rvm/bin/rvmsudo /usr/local/rvm/bin/rvm #{new_resource.ruby} do rvm gemset create #{new_resource.name}"
  end

  new_resource.default_gems.each do |gem|
    rvm_execute "installing gem: #{gem}" do
      ruby new_resource.ruby
      gemset new_resource.name

      code "gem install #{gem}"
    end
  end
end

action :delete do

end
