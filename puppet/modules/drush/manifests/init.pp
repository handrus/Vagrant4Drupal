class drush {
	exec {
		'pear channel-discover':
			command => 'pear channel-discover pear.drush.org',
			require => Package['php-pear'],
	}
	exec {
		'pear install':
			command => 'pear install drush/drush',
			require => Exec['pear channel-discover'],
	}
	exec {
		'drush':
			require => Exec['pear install'],
	}
}
