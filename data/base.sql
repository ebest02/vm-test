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
MODIFY `p_id` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=0;

INSERT INTO `products` VALUES ('573', '1', 'Tortellinis', '0'), ('574', '1', 'Parmesan rap&eacute;', '0'), ('575', '1', 'Saumon', '0'), ('576', '1', 'Cr&egrave;me fra&icirc;che', '0'), ('577', '2', 'Vittel', '0'), ('578', '1', 'Gateau chocolat', '0'), ('579', '1', 'Caf&eacute;', '0'), ('580', '3', 'Produit vaisselle', '0'), ('581', '3', 'Eponges', '0'), ('582', '1', 'Cacahuettes', '0'), ('583', '1', 'Jus d\'orange', '0'), ('584', '2', 'Champagne', '0'), ('585', '2', 'Perrier', '0'), ('586', '1', 'Tome', '0'), ('587', '1', 'Pain', '0'), ('588', '2', 'Quincy (vin blanc)', '0'), ('589', '3', 'Produit vitres', '0'), ('590', '3', 'Serpill&egrave;re', '0');
