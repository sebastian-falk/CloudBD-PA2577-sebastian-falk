  # exec { 'apt-update':
  #   command => '/usr/bin/apt-get update'
  # }

  # package { 'curl':
  #   ensure  => installed,
  #   require => Exec['apt-update'],
  # }

  # exec { 'exec curl':
  #   command => '/usr/bin/curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -',
  #   onlyif  => '/bin/which curl',
  # }

  # package { 'nodejs':
  #   ensure  => installed,
  #   require => Exec['apt-update', 'exec curl'],
  # }
