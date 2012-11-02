class Chef::Recipe
  def log_dir(name, &block)
    base_directories_log name, &block
    "/var/logs/#{name}"
  end

  def site_dir(name, &block)
    base_directories_site name, &block
    "/srv/www/#{name}"
  end
end
