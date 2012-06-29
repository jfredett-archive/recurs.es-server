bash "installing 1.9.3" do
  user 'root'
  code "#{node['rvm']['path']} install 1.9.3"
end
