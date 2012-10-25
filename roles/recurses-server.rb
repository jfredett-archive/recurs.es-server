name        'recurses-server'
description 'The recurs.es web server'

run_list(
  'recipe[base_directories]',
  'recipe[git]',
  'recipe[monit]',
  'recipe[nginx]'
)

