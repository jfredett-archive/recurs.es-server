maintainer       'Joseph Fredette'
maintainer_email 'jfredett@gmail.com'
license          'All rights reserved'
description      'Installs/Configures nginx'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "0.0.1"

#depends 'recurses-site', '~> 0.0.1'
depends 'base_directories', '~> 0.0.1'
depends 'monit', '~> 0.0.1'

supports 'arch'


