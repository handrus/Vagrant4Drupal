class apache {
	package {
		'apache2':
			require => Exec['apt-get update'],
	}
	service {
		'apache2':
			ensure => running,
			enable => true,
			require => Package['apache2'],
	}
	exec {
		'a2enmod rewrite':
			require => Service['apache2'],
	}

	file {
		'/etc/apache2/sites-available/vagrant4drupal.dev':
			ensure => present,
			source => '/vagrant/puppet/modules/apache/files/vagrant4drupal.dev.apacheconf',
			require => Service['apache2'],
	}
	exec {
		'a2ensite vagrant4drupal.dev':
			subscribe => File['/etc/apache2/sites-available/vagrant4drupal.dev'],
	}
}
