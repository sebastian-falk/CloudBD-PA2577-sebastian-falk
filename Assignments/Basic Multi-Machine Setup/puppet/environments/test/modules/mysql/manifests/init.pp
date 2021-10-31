# == Class: mysql
#
# Installs and runs (without having to start) MySQL server, 
#
class mysql {
  package { ['mysql-server']:
    ensure => present;
  }

  service { 'mysql':
    ensure  => running,
    require => Package['mysql-server'];
  }

  exec { 'set mysql pw':
    command => '/usr/bin/mysql -u root -e "use mysql; 
    update user set authentication_string=password(\'root\') where user=\'root\'; 
    update user set plugin=\'mysql_native_password\' where User=\'root\';"',
    require => Service['mysql'],
  }

  exec { 'restart mysql':
    command => '/bin/systemctl restart mysql',
    require => Exec['set mysql pw'],
  }
}
