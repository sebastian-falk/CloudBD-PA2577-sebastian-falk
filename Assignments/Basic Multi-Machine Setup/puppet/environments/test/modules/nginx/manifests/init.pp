# == Class: nginx
#
# Installs and run nginx, 
#
class nginx {
  package { 'install nginx':
    ensure  => installed,
    require => Exec['apt-get update'],
  }

  exec { 'start nginx':
    command => '/etc/init.d/nginx start',
    onlyif  => '/etc/init.d/nginx',
    require => Package['nginx'];
  }

  service { 'nginx running':
    ensure  => running,
    require => Package['start nginx'];
  }
}
