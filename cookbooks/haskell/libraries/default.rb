class Chef::Recipe
  def cabal_update(opts = {})
    haskell_cabal 'cabal update' do
      action :update
      user (opts[:as] || 'root')
    end
  end

  def cabal(*args, &block)
    haskell_cabal(*args, &block)
  end
end
