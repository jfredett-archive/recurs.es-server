name        'arch_base'
description 'Initializes a minimal Arch Linux system (package db update, basic directory layout), also includes utility recipes'

run_list(
  'recipe[arch_init]',
  'recipe[utility]',
  'recipe[base_directories]'
)
