# vagrant4drupal provisioner

# Apache server
package {
  'apache2':
    ensure => present,
}
  service {
    'apache2':
      ensure => running,
      enable => true,
      require => Package['apache2'],
  }
    file {
      '/var/www':
        ensure => link,
        target => '/vagrant/www',
        require => Service['apache2'],
    }
notify {
  'Apache server: OK.':
    require => Service['apache2'],
}

# MySQL server
package {
  'mysql-server':
    ensure => present,
}
  service {
    'mysql':
      ensure => running,
      enable => true,
      require => Package['mysql-server'],
  }
    notify {
      'MySQL server: OK.':
        require => Service['mysql'],
    }

# PHP language
package {
  'php5':
    ensure => installed,
}
