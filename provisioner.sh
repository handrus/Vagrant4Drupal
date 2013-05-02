#!/usr/bin/env bash

# Getting everything up to date
apt-get update
apt-get upgrade

# Installing basic tools
apt-get install -y git htop

# Installing and configuring Apache HTTP server
apt-get install -y apache2
rm -fR /var/www
ln -fs /vagrant/www /var/www

# Installing PHP language and modules
apt-get install -y php5 php5-gd php5-pdo php5-sqlite

# Installing Drush
apt-get install -y  php-pear
pear channel-discover pear.drush.org
pear install drush/drush
drush

# Installing and configuring MySQL server and tools
apt-get install -f -y mysql-server mysqltuner
# apt-get -f install # solve MySQL dependencies
