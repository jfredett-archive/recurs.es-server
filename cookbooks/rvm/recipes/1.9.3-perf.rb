bash "installing 1.9.3 with the falcon performance patch" do
  user 'root'
  code "#{node['rvm']['path']} install 1.9.3 --patch falcon"
end
