name        'arch_base'
description 'Initializes a minimal Arch Linux system (package db update, basic directory layout)'

run_list(
  'recipe[arch_init]',
  'recipe[base_directories]'
)
