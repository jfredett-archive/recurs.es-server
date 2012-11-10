name        'recurses-server'
description 'The recurs.es web server'

run_list(
  'recipe[arch_init]',
  'recipe[base_directories]',
  'recipe[git]',
  'recipe[rvm]',
  'recipe[monit]',
  'recipe[nginx]'
)

