class Chef::Recipe
  def log_dir(name, &block)
    base_directories_log name, &block
  end

  def site_dir(name, &block)
    base_directories_site name, &block
  end

end
