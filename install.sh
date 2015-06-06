#!/usr/bin/env bash

<<<<<<< HEAD
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
=======

mysql -uroot -e "
CREATE TABLE IF NOT EXISTS `categories` (
`c_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=4 ;


INSERT INTO `categories` (`c_id`, `name`) VALUES
(1, 'Nourriture'),
(2, 'Boisson'),
(3, 'Produit d''entretien');


CREATE TABLE IF NOT EXISTS `products` (
`p_id` int(11) NOT NULL,
  `cat_id` int(11) NOT NULL,
  `product` varchar(255) DEFAULT NULL,
  `locked` int(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 AUTO_INCREMENT=573 ;

ALTER TABLE `categories`
 ADD PRIMARY KEY (`c_id`);

ALTER TABLE `products`
 ADD PRIMARY KEY (`p_id`,`cat_id`,`locked`);

ALTER TABLE `categories`
MODIFY `c_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=0;

ALTER TABLE `products`
MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=0;"
>>>>>>> 12451f6af0f632b86266902c0f2b1f4e2eed5fae
