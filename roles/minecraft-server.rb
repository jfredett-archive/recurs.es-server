name        'minecraft-server'
description 'A bukkit-based minecraft server'

run_list(
  'recipe[arch_init]',
  'recipe[base_directories]',
  'recipe[java]',
  'recipe[monit]', # for monitoring
  'recipe[nginx]', # for exposing the map plugin
  'recipe[tekkit]' # use a sub-recipe for plugins? use a role?
)




