class Chef::Recipe
  def remote_archive(name, &block)
    utility_remote_archive name, &block
  end

  def group_add(opts = {})
    raise if opts.length > 1
    user, grp = opts.first
    group grp do
      action :modify
      append true
      users user
    end
  end
end
