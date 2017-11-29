#!/bin/bash

DB_NAME="wordpress"
LOCAL_BIN="/usr/local/bin"
VAGRANT_PATH="/vagrant"

echo "---> Installing apt packages"
apt -y update && \
apt -y upgrade && \
DEBIAN_FRONTEND=noninteractive apt -y install unzip npm nodejs mysql-client mysql-server python-mysqldb php7.0 php7.0-cli php7.0-curl php7.0-gd php-imagick php7.0-mysql php7.0-xmlrpc apache2 libapache2-mod-php7.0 && \

echo "---> Enable mod rewrite"
a2enmod rewrite && \

echo "---> Adding ubuntu user to admin groups"
usermod -a -G www-data,adm,root ubuntu && \

echo "---> Adding ubuntu new home user"
usermod -d $VAGRANT_PATH ubuntu && \

echo "---> Adding ubuntu user to admin groups"
usermod -a -G adm,root www-data && \

echo "---> Creating database"
{ mysqladmin -u root create $DB_NAME ; } || { echo "ok" ; } 

echo "---> Populating database"
mysql -u root $DB_NAME < /vagrant/db/base.sql && \
echo "grant all privileges on wordpress.* to 'ubuntu'@'%' identified by 'mysql';" | mysql && \

echo "---> Install wp-cli"
wget -q -c https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O $LOCAL_BIN/wp && \
chmod -v 755 $LOCAL_BIN/wp && \

echo "---> Configuring apache2 vhost"
cp -v $VAGRANT_PATH/templates/vhost.conf /etc/apache2/sites-available/ && \

echo "--> Installing wordpress"
./get_wordpress.sh

echo "---> Configuring wp-config"
cp -v $VAGRANT_PATH/templates/wp-config-sample.php $VAGRANT_PATH/src/wp-config.php && \

echo "---> cp htaccess template"
cp -v $VAGRANT_PATH/src/_htaccess $VAGRANT_PATH/src/.htaccess

echo "---> Create symbolic link to nodejs"
ln -fvs /usr/bin/nodejs /usr/bin/node

echo "---> Enable site vhost"
a2ensite vhost && \
a2dissite 000-default

echo "---> Restarting apache"
/etc/init.d/apache2 restart 

echo "<------------- all done ------------->"