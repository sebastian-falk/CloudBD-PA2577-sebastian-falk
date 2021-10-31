  exec { 'apt-update':
    command => '/usr/bin/apt-get update'
  }

  package { 'nginx':
    ensure  => installed,
    require => Exec['apt-update'],
  }

  exec { 'start nginx':
    command => '/etc/init.d/nginx start',
    onlyif  => '/etc/init.d/nginx',
  }

# TODO Check if started
  # exec { 'status nginx':
  #   command => '/usr/sbin/service nginx status',
  # }
