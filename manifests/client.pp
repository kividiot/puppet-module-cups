class cups::client (
  $servername = 'cupsserv',
) {

  if $::osfamily == 'RedHat' or $::osfamily == 'Suse' {

    if $::osfamily == 'RedHat' {
      $packages = ['cups', 'cups-libs', ]
    }

    if $::osfamily == 'RedHat' {
      $packages = ['cups', 'cups-libs', 'cups-client', ]
    }

    package {$packages:
      present => 'ensure',
    }
  
    file {'cups_client_conf':
      path    => '/etc/cups/client.conf',
      ensure  => present,
      owner   => 'root',
      group   => 'root',
      mode    => '0644',
      content => template('cups/client.conf.erb'),
      require => Package[$packages],
    }

    service {'cups':
      ensure  => 'running',
      enable  =>  true,
      require => File['/etc/cups/client.conf'],
    }
  }
}
