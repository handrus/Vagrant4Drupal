class apache {
	file {
		'/var/www':
			ensure => link,
			target => '/vagrant/www',
	}
	package {
		'apache2':
			require => [
				Exec['apt-get update'],
				File['/var/www'],
			],
}
	service {
		'apache2':
			ensure => running,
			enable => true,
			require => Package['apache2'],
	}
}
