task :create, [:name] do |t, args|
  return 1 unless args[:name]
  exec "bundle exec knife cookbook create #{args[:name]} -o cookbooks/ -r md"
end

task :rebuild_box do
  server_number = gets.chomp
  box_name = "boxen/arch_linux-#{Time.now.strftime("%m-%d-%Y_%s")}.box"

  %x{mv Vagrantfile Vagrantfile.bak}
  %x{cp boxen/EmptyBox Vagrantfile}

  %x{vagrant destroy -f}
  %x{vagrant up}
  %x{vagrant package -base server_#{server_number} --output #{box_name}}

  %x{vagrant box remove arch_linux}
  %x{vagrant box add arch_linux #{box_name}}

  %x{rm Vagrantfile}
  %x{mv Vagrantfile.bak Vagrantfile}
end
