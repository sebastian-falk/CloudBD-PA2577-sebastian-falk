# create a new run stage to ensure certain modules are included first
stage { 'pre':
  before => Stage['main']
}

exec { 'apt-get update':
  command => '/usr/bin/apt-get update';
}

node 'dbserver.home' {
  include mysql
}

node 'appserver.home' {
  include nodejs
}

node 'web.home' {
  include nginx
}
