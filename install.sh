#!/usr/bin/env bash


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
