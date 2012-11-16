name        'recurses-static'
description 'A server for the static recurs.es blog'

run_list(
  'recipe[arch_init]',
  'recipe[base_directories]',
  'recipe[git]',
  'recipe[rvm]',
  'recipe[monit]',
  'recipe[nginx]',
  'recipe[recurses-static]'
)

