name        'recurses-server'
description 'The recurs.es web server'

run_list(
  'recipe[git]',
  'recipe[rvm::rbx19]'
)

