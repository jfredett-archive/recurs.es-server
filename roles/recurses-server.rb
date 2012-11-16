name        'recurses-server'
description 'The recurs.es web server'

run_list(
  'role[recurses-static]',
  'recipe[haskell]'
)

