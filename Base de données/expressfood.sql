-- phpMyAdmin SQL Dump
-- version 4.7.9
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le :  jeu. 07 juin 2018 à 06:34
-- Version du serveur :  5.7.21
-- Version de PHP :  7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `expressfood`
--

-- --------------------------------------------------------

--
-- Structure de la table `adresse`
--

DROP TABLE IF EXISTS `adresse`;
CREATE TABLE IF NOT EXISTS `adresse` (
  `idadresse` int(11) NOT NULL AUTO_INCREMENT,
  `numero` varchar(3) DEFAULT NULL,
  `rue` varchar(100) DEFAULT NULL,
  `code_postal` varchar(5) DEFAULT NULL,
  `ville` varchar(100) DEFAULT NULL,
  `digicode` varchar(45) DEFAULT NULL,
  `etage` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`idadresse`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `adresse`
--

INSERT INTO `adresse` (`idadresse`, `numero`, `rue`, `code_postal`, `ville`, `digicode`, `etage`) VALUES
(1, '40', 'Avenue des Prés', '75000', 'Paris', '', '3'),
(2, '7', 'Rue Impasse', '75000', 'Paris', '', '0');

-- --------------------------------------------------------

--
-- Structure de la table `chef`
--

DROP TABLE IF EXISTS `chef`;
CREATE TABLE IF NOT EXISTS `chef` (
  `idchef` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idchef`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `chef`
--

INSERT INTO `chef` (`idchef`, `nom`, `prenom`, `telephone`, `email`) VALUES
(1, 'Jack', 'John', '0609045432', 'johnjack@mail.com'),
(2, 'Patrick', 'Paul', '0604145432', 'patrickpaul@mail.com');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE IF NOT EXISTS `client` (
  `idclient` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(100) DEFAULT NULL,
  `prenom` varchar(100) DEFAULT NULL,
  `raison_social` varchar(100) DEFAULT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`idclient`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`idclient`, `nom`, `prenom`, `raison_social`, `telephone`, `email`) VALUES
(1, 'Dupont', 'Jean', '', '0609090908', 'jeandupont@mail.com'),
(2, 'Durand', 'Pierre', '', '0809090709', 'pierredurand@mail.com'),
(3, 'Bruno', 'Alain', '', '0809045709', 'alainbruno@mail.com');

-- --------------------------------------------------------

--
-- Structure de la table `client_has_adresse`
--

DROP TABLE IF EXISTS `client_has_adresse`;
CREATE TABLE IF NOT EXISTS `client_has_adresse` (
  `client_idclient` int(11) NOT NULL,
  `adresse_idadresse` int(11) NOT NULL,
  PRIMARY KEY (`client_idclient`,`adresse_idadresse`),
  KEY `fk_client_has_adresse_adresse1_idx` (`adresse_idadresse`),
  KEY `fk_client_has_adresse_client_idx` (`client_idclient`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

DROP TABLE IF EXISTS `commande`;
CREATE TABLE IF NOT EXISTS `commande` (
  `idcommande` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `client` int(11) DEFAULT NULL,
  `adresse` int(11) DEFAULT NULL,
  `plat` int(11) DEFAULT NULL,
  `dessert` int(11) DEFAULT NULL,
  `quantite_plat` varchar(2) DEFAULT NULL,
  `quantite_dessert` varchar(2) DEFAULT NULL,
  `prix_total` decimal(5,2) DEFAULT NULL,
  `livreur` int(11) DEFAULT NULL,
  `statut` tinyint(4) DEFAULT NULL,
  `paiement_idpaiement` int(11) NOT NULL,
  PRIMARY KEY (`idcommande`),
  KEY `adresse_client_idx` (`adresse`),
  KEY `plat_commande_idx` (`plat`),
  KEY `dessert_commande_idx` (`dessert`),
  KEY `livreur_commande_idx` (`livreur`),
  KEY `client_commande_idx` (`client`),
  KEY `fk_commande_paiement1_idx` (`paiement_idpaiement`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `commande`
--

INSERT INTO `commande` (`idcommande`, `date`, `client`, `adresse`, `plat`, `dessert`, `quantite_plat`, `quantite_dessert`, `prix_total`, `livreur`, `statut`, `paiement_idpaiement`) VALUES
(1, '2018-05-15', 1, 1, 2, 1, '1', '1', '9.50', 1, 1, 1),
(2, '2018-05-15', 2, 2, 2, 1, '1', '1', '9.50', 2, 0, 2);

-- --------------------------------------------------------

--
-- Structure de la table `dessert`
--

DROP TABLE IF EXISTS `dessert`;
CREATE TABLE IF NOT EXISTS `dessert` (
  `iddessert` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prix` decimal(5,2) DEFAULT NULL,
  `chef_idchef` int(11) NOT NULL,
  PRIMARY KEY (`iddessert`),
  KEY `fk_dessert_chef1_idx` (`chef_idchef`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `dessert`
--

INSERT INTO `dessert` (`iddessert`, `date`, `nom`, `prix`, `chef_idchef`) VALUES
(1, '2018-05-15', 'Tarte fraise', '4.50', 1),
(2, '2018-05-15', 'Eclair chocolat', '5.50', 2);

-- --------------------------------------------------------

--
-- Structure de la table `livreur`
--

DROP TABLE IF EXISTS `livreur`;
CREATE TABLE IF NOT EXISTS `livreur` (
  `idlivreur` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(45) DEFAULT NULL,
  `prenom` varchar(45) DEFAULT NULL,
  `telephone` varchar(10) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `longitude` decimal(8,5) DEFAULT NULL,
  `latitude` decimal(8,5) DEFAULT NULL,
  `statut` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`idlivreur`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `livreur`
--

INSERT INTO `livreur` (`idlivreur`, `nom`, `prenom`, `telephone`, `email`, `longitude`, `latitude`, `statut`) VALUES
(1, 'Mike', 'Polo', '0687956576', 'polomike@mail.com', '65.76477', '23.78477', 0),
(2, 'David', 'Henri', '0683456576', 'henridavid@mail.com', '12.76477', '45.78477', 1);

-- --------------------------------------------------------

--
-- Structure de la table `paiement`
--

DROP TABLE IF EXISTS `paiement`;
CREATE TABLE IF NOT EXISTS `paiement` (
  `idpaiement` int(11) NOT NULL AUTO_INCREMENT,
  `client` int(11) DEFAULT NULL,
  `cb` varchar(45) DEFAULT NULL,
  `paypal` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpaiement`),
  KEY `cb_client_idx` (`client`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `paiement`
--

INSERT INTO `paiement` (`idpaiement`, `client`, `cb`, `paypal`) VALUES
(1, 1, '', 'paypal1@mail.com'),
(2, 2, '', 'paypal@mail.com');

-- --------------------------------------------------------

--
-- Structure de la table `plat`
--

DROP TABLE IF EXISTS `plat`;
CREATE TABLE IF NOT EXISTS `plat` (
  `idplat` int(11) NOT NULL AUTO_INCREMENT,
  `date` date DEFAULT NULL,
  `nom` varchar(45) DEFAULT NULL,
  `prix` decimal(5,2) DEFAULT NULL,
  `chef_idchef` int(11) NOT NULL,
  PRIMARY KEY (`idplat`),
  KEY `fk_plat_chef1_idx` (`chef_idchef`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `plat`
--

INSERT INTO `plat` (`idplat`, `date`, `nom`, `prix`, `chef_idchef`) VALUES
(1, '2018-05-15', 'Pizza', '5.00', 1),
(2, '2018-05-15', 'Frites', '5.50', 2);

-- --------------------------------------------------------

--
-- Structure de la table `stock_livreur`
--

DROP TABLE IF EXISTS `stock_livreur`;
CREATE TABLE IF NOT EXISTS `stock_livreur` (
  `id_stock` int(11) NOT NULL AUTO_INCREMENT,
  `livreur` int(11) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `quantite_plat` varchar(2) DEFAULT NULL,
  `quantite_dessert` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id_stock`),
  KEY `stocklivreur_idx` (`livreur`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `stock_livreur`
--

INSERT INTO `stock_livreur` (`id_stock`, `livreur`, `date`, `quantite_plat`, `quantite_dessert`) VALUES
(1, 1, '2018-05-15', '10', '8'),
(2, 2, '2018-05-15', '15', '15');

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `client_has_adresse`
--
ALTER TABLE `client_has_adresse`
  ADD CONSTRAINT `fk_client_has_adresse_adresse1` FOREIGN KEY (`adresse_idadresse`) REFERENCES `adresse` (`idadresse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_client_has_adresse_client` FOREIGN KEY (`client_idclient`) REFERENCES `client` (`idclient`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `adresse_client` FOREIGN KEY (`adresse`) REFERENCES `adresse` (`idadresse`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `client_commande` FOREIGN KEY (`client`) REFERENCES `client` (`idclient`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `dessert_commande` FOREIGN KEY (`dessert`) REFERENCES `dessert` (`iddessert`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_commande_paiement1` FOREIGN KEY (`paiement_idpaiement`) REFERENCES `paiement` (`idpaiement`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `livreur_commande` FOREIGN KEY (`livreur`) REFERENCES `livreur` (`idlivreur`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `plat_commande` FOREIGN KEY (`plat`) REFERENCES `plat` (`idplat`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `dessert`
--
ALTER TABLE `dessert`
  ADD CONSTRAINT `fk_dessert_chef1` FOREIGN KEY (`chef_idchef`) REFERENCES `chef` (`idchef`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `paiement`
--
ALTER TABLE `paiement`
  ADD CONSTRAINT `cb_client` FOREIGN KEY (`client`) REFERENCES `client` (`idclient`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `plat`
--
ALTER TABLE `plat`
  ADD CONSTRAINT `fk_plat_chef1` FOREIGN KEY (`chef_idchef`) REFERENCES `chef` (`idchef`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Contraintes pour la table `stock_livreur`
--
ALTER TABLE `stock_livreur`
  ADD CONSTRAINT `stocklivreur` FOREIGN KEY (`livreur`) REFERENCES `livreur` (`idlivreur`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
