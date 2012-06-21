task :create, [:name] do |t, args|
  return 1 unless args[:name]
  exec "bundle exec knife cookbook create #{args[:name]} -o cookbooks/ -r md"
end
