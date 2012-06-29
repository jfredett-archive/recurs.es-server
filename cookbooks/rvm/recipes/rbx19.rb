bash "installing Rubinius (1.9)" do
  user 'root'
  code "#{node['rvm']['path']} install rbx --1.9"
end
