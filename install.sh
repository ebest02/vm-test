#!/usr/bin/env bash

echo "Configuring MySQL for test app"
if [ ! -f /var/log/dbinstalled ];
then
    echo "CREATE USER 'dsitest'@'localhost' IDENTIFIED BY 'e4b5hx'" | mysql -uroot 
    echo "CREATE DATABASE dsi_test" | mysql -uroot 
    echo "GRANT ALL ON dsi_test.* TO 'dsitest'@'localhost'" | mysql -uroot 
    echo "flush privileges" | mysql -uroot 
    sudo touch /var/log/dbinstalled
    if [ -f /vagrant/data/base.sql ];
    then
        mysql -uroot dsi_test < /vagrant/data/base.sql
    fi
fi

echo "Configuring Nginx"
cp /vagrant/data/vhost_nginx /etc/nginx/sites-available/vhost_nginx > /dev/null
 
ln -s /etc/nginx/sites-available/vhost_nginx /etc/nginx/sites-enabled/
 
sudo rm -rf /etc/nginx/sites-available/default

echo "Configuring PHP"
sudo service php5-fpm stop
rm /etc/php5/fpm/php.ini
cp /vagrant/data/php.ini /etc/php5/fpm/
sudo service php5-fpm start 
sudo service nginx restart > /dev/null
echo "EVERYTHING OK"
