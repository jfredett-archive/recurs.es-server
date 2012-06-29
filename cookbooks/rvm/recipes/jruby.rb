bash "installing JRuby" do
  user 'root'
  code "#{node['rvm']['path']} install jruby"
end
