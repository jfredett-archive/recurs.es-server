name        'recurses-static'
description 'A server for the static recurs.es blog'

run_list(
  'role[arch_server]',
  'recipe[rvm]',
  'recipe[nginx]',
  'recipe[recurses-static]'
)

