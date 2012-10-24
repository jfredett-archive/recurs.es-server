default['nginx'] = {
  # number of worker processes to use
  'worker_processes'   => 1,
  # number of worker connections to use
  'worker_connections' => 1024,

  'executing' => {
    'user'    => 'www-server' ,
    'group'   => 'www',
  },

  'location' => {
    'pid'          => '/tmp/nginx.pid'                         ,
    'error_log'    => '/srv/log/error.log'                     ,
    'access_log'   => '/srv/log/access.log'                    ,
    'static_files' => '/srv/http/recurs.es-site/public'        , #see note about socket?
    'error_pages'  => '/srv/http/recurs.es-site/public/error/'   #ibid
  },

  #socket? and socket_name could be based on a dependency on the app, which
  #could specify these values for better consistency, or vice versa.
  'socket?' => true,
  'socket_name' => 'webserver.sock',

  #see above
  #not needed if socket? is true, else, use the port of your server
  'tcp' => nil,

  'max_body_size' => '4G',

  'keepalive' => 5,

  #files to try to serve directly from nginx, list of string patterns. see nginx
  #docs
  'try_files' => []
}
