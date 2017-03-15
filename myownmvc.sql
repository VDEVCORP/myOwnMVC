-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mer 15 Mars 2017 à 17:51
-- Version du serveur :  5.7.9
-- Version de PHP :  5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `myownmvc`
--

-- --------------------------------------------------------

--
-- Structure de la table `page`
--

DROP TABLE IF EXISTS `page`;
CREATE TABLE IF NOT EXISTS `page` (
  `id_page` int(11) NOT NULL AUTO_INCREMENT,
  `url_page` varchar(100) NOT NULL,
  `name_page` varchar(100) NOT NULL,
  `description_page` varchar(200) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`id_page`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `page`
--

INSERT INTO `page` (`id_page`, `url_page`, `name_page`, `description_page`) VALUES
(1, 'admin/manage', 'Espace Administrateur', 'Espace de management des administrateurs du site'),
(2, 'admin/exempleAdmin', 'Exemple Administrateur', 'Page accessible uniquement aux rang Admin'),
(3, 'regular/exempleRegular', 'Exemple Regular', 'Page accessible uniquement aux rang Regular'),
(4, 'regular/home', 'Espace Regular', 'Espace personnel d''un utilisateur regular');

-- --------------------------------------------------------

--
-- Structure de la table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id_user` int(11) NOT NULL AUTO_INCREMENT,
  `rank` int(11) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `valid` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id_user`),
  KEY `rank` (`rank`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users`
--

INSERT INTO `users` (`id_user`, `rank`, `email`, `valid`) VALUES
(1, 1, 'admin@test.dev', 1),
(2, 2, 'regular@test.dev', 1);

-- --------------------------------------------------------

--
-- Structure de la table `users_access`
--

DROP TABLE IF EXISTS `users_access`;
CREATE TABLE IF NOT EXISTS `users_access` (
  `users_acess_id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_rank` int(11) NOT NULL,
  `fk_id_page` int(11) NOT NULL,
  PRIMARY KEY (`users_acess_id`),
  KEY `fk_id_page` (`fk_id_page`),
  KEY `fk_id_rank` (`fk_id_rank`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users_access`
--

INSERT INTO `users_access` (`users_acess_id`, `fk_id_rank`, `fk_id_page`) VALUES
(1, 1, 1),
(3, 1, 2),
(4, 2, 3),
(5, 2, 4);

-- --------------------------------------------------------

--
-- Structure de la table `users_login`
--

DROP TABLE IF EXISTS `users_login`;
CREATE TABLE IF NOT EXISTS `users_login` (
  `id_login` int(11) NOT NULL AUTO_INCREMENT,
  `fk_id_user` int(11) NOT NULL,
  `password_user` varchar(255) NOT NULL,
  PRIMARY KEY (`id_login`),
  KEY `fk_id_user` (`fk_id_user`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users_login`
--

INSERT INTO `users_login` (`id_login`, `fk_id_user`, `password_user`) VALUES
(1, 1, 'd033e22ae348aeb5660fc2140aec35850c4da997'),
(2, 2, '5f51efbecdb644c4ea8a109f81947c1490d5ba62');

-- --------------------------------------------------------

--
-- Structure de la table `users_rank`
--

DROP TABLE IF EXISTS `users_rank`;
CREATE TABLE IF NOT EXISTS `users_rank` (
  `id_rank` int(11) NOT NULL AUTO_INCREMENT,
  `name_rank` varchar(255) NOT NULL,
  PRIMARY KEY (`id_rank`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Contenu de la table `users_rank`
--

INSERT INTO `users_rank` (`id_rank`, `name_rank`) VALUES
(1, 'admin'),
(2, 'regular');

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `fk_rank_users` FOREIGN KEY (`rank`) REFERENCES `users_rank` (`id_rank`);

--
-- Contraintes pour la table `users_access`
--
ALTER TABLE `users_access`
  ADD CONSTRAINT `fk_id_page_users_access` FOREIGN KEY (`fk_id_page`) REFERENCES `page` (`id_page`),
  ADD CONSTRAINT `fk_id_rank_users_access` FOREIGN KEY (`fk_id_rank`) REFERENCES `users_rank` (`id_rank`);

--
-- Contraintes pour la table `users_login`
--
ALTER TABLE `users_login`
  ADD CONSTRAINT `fk_id_users_users_login` FOREIGN KEY (`fk_id_user`) REFERENCES `users` (`id_user`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
