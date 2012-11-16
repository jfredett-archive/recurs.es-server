name        'arch_server'
description 'A minimal arch_server with monitoring and git'

run_list(
  'role[arch_base]',
  'recipe[git]',
  'recipe[monit]'
)
