-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 12. Mrz 2022 um 13:46
-- Server-Version: 10.4.22-MariaDB
-- PHP-Version: 8.0.13

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `be15_cr9_famazon_peter`
--
CREATE DATABASE IF NOT EXISTS `be15_cr9_famazon_peter` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `be15_cr9_famazon_peter`;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `area`
--

CREATE TABLE `area` (
  `zip` varchar(8) NOT NULL,
  `city` varchar(30) NOT NULL,
  `country` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `area`
--

INSERT INTO `area` (`zip`, `city`, `country`) VALUES
('AT-5020', 'Salzburg', 'Austria'),
('At-5121', 'Ostermiething', 'Austria'),
('AT-5201', 'Seekirchen', 'Austria'),
('D-84529', 'Tittmoning', 'Germany');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `bank`
--

CREATE TABLE `bank` (
  `fk_payOpt_id` int(11) NOT NULL,
  `IBAN` varchar(34) NOT NULL,
  `BIC` varchar(12) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `bank`
--

INSERT INTO `bank` (`fk_payOpt_id`, `IBAN`, `BIC`, `name`) VALUES
(1, 'AT59 7719 0895 8950 8362 7966 1137', 'WARUMWIESO', 'Mortal Bank'),
(5, 'HU59 7719 0895 8950 8362 7966 1137', 'IMMERWIEDER', 'Destroyer & Co KG'),
(9, 'AT86 2778 0325 4798 8680 2543 696', 'WIESOAUCH', 'Ausbeuter AG');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `cart`
--

CREATE TABLE `cart` (
  `fk_userName` varchar(12) NOT NULL,
  `fk_item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `cart`
--

INSERT INTO `cart` (`fk_userName`, `fk_item_id`, `quantity`) VALUES
('conny911', 3, 1),
('conny911', 3, 2),
('henryThe8Iam', 7, 1),
('henryThe8Iam', 5, 2),
('user1', 3, 1),
('user1', 4, 4);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `creditcard`
--

CREATE TABLE `creditcard` (
  `fk_payOpt_id` int(11) NOT NULL,
  `number` varchar(20) NOT NULL,
  `validDate` date NOT NULL,
  `secure` varchar(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `creditcard`
--

INSERT INTO `creditcard` (`fk_payOpt_id`, `number`, `validDate`, `secure`) VALUES
(2, '5266 2422 9858 0006', '2027-03-01', '031'),
(7, '3333 4444 5555 6666', '2024-10-01', '333'),
(10, '3266 2422 9858 0006', '2025-06-01', '001');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `customer`
--

CREATE TABLE `customer` (
  `userName` varchar(12) NOT NULL,
  `firstName` varchar(25) NOT NULL,
  `lastName` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `fk_zip` varchar(8) NOT NULL,
  `email` varchar(30) NOT NULL,
  `tel` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `customer`
--

INSERT INTO `customer` (`userName`, `firstName`, `lastName`, `address`, `fk_zip`, `email`, `tel`) VALUES
('conny911', 'Max', 'Lustig', 'Zanderweg 13', 'AT-5201', 'maximilian@drott.at', '06212/5576'),
('henryThe8Iam', 'John', 'Cleese', 'LifeOfBrian 33', 'At-5121', 'meaning@of.life', '0123/456789'),
('tester1313', 'Peter', 'TestChar', 'Impfsackgasse 17', 'At-5121', 'antivax1313@gmail.com', '0664/4066440'),
('user1', 'Susi', 'Sorglos', 'Neuhaus 1a', 'D-84529', 'susal@jkhdg.de', '0721 18518744'),
('user888', 'Jenny', 'TestChar', 'Bloedheitsiegt 33', 'AT-5020', 'jane@test.com', '0662/334455');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `invoice`
--

CREATE TABLE `invoice` (
  `invoice_id` int(11) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `invoice`
--

INSERT INTO `invoice` (`invoice_id`, `date`) VALUES
(1, '2022-03-03'),
(2, '2022-03-01'),
(3, '2022-02-28'),
(4, '2022-02-16'),
(5, '2022-03-09'),
(6, '2022-03-09');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `items-stock`
--

CREATE TABLE `items-stock` (
  `item_id` int(11) NOT NULL,
  `fk_product_id` int(11) NOT NULL,
  `fk_supplier_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(20,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `items-stock`
--

INSERT INTO `items-stock` (`item_id`, `fk_product_id`, `fk_supplier_id`, `quantity`, `price`) VALUES
(1, 2, 1, 33, '7.90'),
(2, 2, 3, 22, '8.50'),
(3, 1, 3, 5, '15.00'),
(4, 4, 2, 10, '33.33'),
(5, 5, 2, 999, '44.50'),
(6, 6, 2, 200, '2.50'),
(7, 3, 1, 20, '9.90');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `order`
--

CREATE TABLE `order` (
  `order_id` int(11) NOT NULL,
  `fk_userName` varchar(12) NOT NULL,
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `order`
--

INSERT INTO `order` (`order_id`, `fk_userName`, `date`) VALUES
(1, 'conny911', '2022-03-03'),
(2, 'henryThe8Iam', '2022-03-01'),
(3, 'tester1313', '2022-02-28'),
(4, 'user888', '2022-02-16'),
(5, 'user888', '2022-03-09');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `orderdetails`
--

CREATE TABLE `orderdetails` (
  `fk_invoice_id` int(11) NOT NULL,
  `fk_order_id` int(11) NOT NULL,
  `fk_item_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `orderdetails`
--

INSERT INTO `orderdetails` (`fk_invoice_id`, `fk_order_id`, `fk_item_id`, `quantity`) VALUES
(1, 1, 2, 2),
(1, 1, 3, 1),
(2, 2, 1, 3),
(3, 3, 4, 1),
(3, 3, 5, 2),
(3, 3, 6, 1),
(4, 4, 7, 2),
(5, 5, 1, 2),
(6, 5, 5, 1);

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `payment`
--

CREATE TABLE `payment` (
  `payment_id` int(11) NOT NULL,
  `fk_payOpt_id` int(11) NOT NULL,
  `fk_invoice_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `payment`
--

INSERT INTO `payment` (`payment_id`, `fk_payOpt_id`, `fk_invoice_id`, `date`) VALUES
(1, 1, 1, '2022-03-04 12:17:48'),
(2, 9, 2, '2022-03-01 16:20:31'),
(3, 3, 3, '2022-03-01 12:22:06'),
(4, 4, 4, '2022-02-16 12:22:45'),
(5, 5, 5, '2022-03-09 14:26:13'),
(6, 7, 6, '2022-03-09 16:26:42');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `paymentoptions`
--

CREATE TABLE `paymentoptions` (
  `payOpt_id` int(11) NOT NULL,
  `fk_userName` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `paymentoptions`
--

INSERT INTO `paymentoptions` (`payOpt_id`, `fk_userName`) VALUES
(1, 'conny911'),
(2, 'conny911'),
(8, 'henryThe8Iam'),
(9, 'henryThe8Iam'),
(3, 'tester1313'),
(10, 'tester1313'),
(4, 'user1'),
(5, 'user888'),
(6, 'user888'),
(7, 'user888');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `paypal`
--

CREATE TABLE `paypal` (
  `fk_payOpt_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `paypal`
--

INSERT INTO `paypal` (`fk_payOpt_id`, `name`) VALUES
(3, 'antivax1313@gmail.com'),
(4, 'susal@jkhdg.de'),
(6, 'jane@test.com'),
(8, 'meaning@of.life');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `discription` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `products`
--

INSERT INTO `products` (`product_id`, `name`, `discription`) VALUES
(1, 'Holzrosenbund', '7 Stück mittlere Grösse'),
(2, 'Blaues Buch', '50 Seiten Leere'),
(3, 'Rotes Buch', '100 Seiten leere Blätter'),
(4, 'Kasperlpuppe', 'lebensecht mit wählbarem Politikergesicht'),
(5, 'Propagandaabbo', '1x ORF (2 Monatszahlrythmus)'),
(6, 'FFP2 Maske', 'Made in AUSTRIA(China)\r\nNutzlos aber perfekt zum Kinderquälen\r\n+ Steigert Sozial Credits');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `shipping`
--

CREATE TABLE `shipping` (
  `shipping_id` int(11) NOT NULL,
  `fk_invoice_id` int(11) NOT NULL,
  `shippingDate` date NOT NULL,
  `deliveryDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `shipping`
--

INSERT INTO `shipping` (`shipping_id`, `fk_invoice_id`, `shippingDate`, `deliveryDate`) VALUES
(1, 1, '2022-03-04', '2022-03-07'),
(2, 2, '2022-03-02', '2022-03-03'),
(3, 3, '2022-02-28', '2022-03-01'),
(4, 4, '2022-02-17', '2022-03-19'),
(5, 5, '2022-03-10', '2022-03-11'),
(6, 6, '2022-03-11', '2022-03-14');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `supplier`
--

CREATE TABLE `supplier` (
  `supplier_id` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `address` varchar(30) NOT NULL,
  `fk_zip` varchar(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `supplier`
--

INSERT INTO `supplier` (`supplier_id`, `name`, `address`, `fk_zip`) VALUES
(1, 'Tester1 GmbH', 'Moosweg 333', 'AT-5020'),
(2, 'EAV', 'Sag niemal nie 1', 'At-5121'),
(3, 'Rosenstengel', 'Blumenweg 1', 'AT-5020');

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `area`
--
ALTER TABLE `area`
  ADD PRIMARY KEY (`zip`);

--
-- Indizes für die Tabelle `bank`
--
ALTER TABLE `bank`
  ADD PRIMARY KEY (`fk_payOpt_id`),
  ADD UNIQUE KEY `IBAN` (`IBAN`);

--
-- Indizes für die Tabelle `cart`
--
ALTER TABLE `cart`
  ADD KEY `fk_userName` (`fk_userName`),
  ADD KEY `fk_item_id` (`fk_item_id`);

--
-- Indizes für die Tabelle `creditcard`
--
ALTER TABLE `creditcard`
  ADD PRIMARY KEY (`fk_payOpt_id`),
  ADD UNIQUE KEY `number` (`number`);

--
-- Indizes für die Tabelle `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`userName`),
  ADD KEY `fk_zip` (`fk_zip`);

--
-- Indizes für die Tabelle `invoice`
--
ALTER TABLE `invoice`
  ADD PRIMARY KEY (`invoice_id`);

--
-- Indizes für die Tabelle `items-stock`
--
ALTER TABLE `items-stock`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `fk_product_id` (`fk_product_id`),
  ADD KEY `fk_supplier_id` (`fk_supplier_id`);

--
-- Indizes für die Tabelle `order`
--
ALTER TABLE `order`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `fk_userName` (`fk_userName`);

--
-- Indizes für die Tabelle `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD KEY `fk_invoice_id` (`fk_invoice_id`),
  ADD KEY `fk_item_id` (`fk_item_id`),
  ADD KEY `fk_order_id` (`fk_order_id`);

--
-- Indizes für die Tabelle `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`),
  ADD KEY `fk_payOpt_id` (`fk_payOpt_id`);

--
-- Indizes für die Tabelle `paymentoptions`
--
ALTER TABLE `paymentoptions`
  ADD PRIMARY KEY (`payOpt_id`),
  ADD KEY `fk_userName` (`fk_userName`);

--
-- Indizes für die Tabelle `paypal`
--
ALTER TABLE `paypal`
  ADD PRIMARY KEY (`fk_payOpt_id`),
  ADD UNIQUE KEY `name` (`fk_payOpt_id`,`name`);

--
-- Indizes für die Tabelle `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`);

--
-- Indizes für die Tabelle `shipping`
--
ALTER TABLE `shipping`
  ADD PRIMARY KEY (`shipping_id`),
  ADD KEY `fk_invoice_id` (`fk_invoice_id`);

--
-- Indizes für die Tabelle `supplier`
--
ALTER TABLE `supplier`
  ADD PRIMARY KEY (`supplier_id`),
  ADD KEY `fk_zip` (`fk_zip`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `invoice`
--
ALTER TABLE `invoice`
  MODIFY `invoice_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `items-stock`
--
ALTER TABLE `items-stock`
  MODIFY `item_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT für Tabelle `order`
--
ALTER TABLE `order`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `paymentoptions`
--
ALTER TABLE `paymentoptions`
  MODIFY `payOpt_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT für Tabelle `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `shipping`
--
ALTER TABLE `shipping`
  MODIFY `shipping_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT für Tabelle `supplier`
--
ALTER TABLE `supplier`
  MODIFY `supplier_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `bank`
--
ALTER TABLE `bank`
  ADD CONSTRAINT `bank_ibfk_1` FOREIGN KEY (`fk_payOpt_id`) REFERENCES `paymentoptions` (`payOpt_id`);

--
-- Constraints der Tabelle `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`fk_userName`) REFERENCES `customer` (`userName`),
  ADD CONSTRAINT `cart_ibfk_2` FOREIGN KEY (`fk_item_id`) REFERENCES `items-stock` (`item_id`);

--
-- Constraints der Tabelle `creditcard`
--
ALTER TABLE `creditcard`
  ADD CONSTRAINT `creditcard_ibfk_1` FOREIGN KEY (`fk_payOpt_id`) REFERENCES `paymentoptions` (`payOpt_id`);

--
-- Constraints der Tabelle `customer`
--
ALTER TABLE `customer`
  ADD CONSTRAINT `customer_ibfk_1` FOREIGN KEY (`fk_zip`) REFERENCES `area` (`zip`);

--
-- Constraints der Tabelle `items-stock`
--
ALTER TABLE `items-stock`
  ADD CONSTRAINT `items-stock_ibfk_1` FOREIGN KEY (`fk_product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `items-stock_ibfk_2` FOREIGN KEY (`fk_supplier_id`) REFERENCES `supplier` (`supplier_id`);

--
-- Constraints der Tabelle `order`
--
ALTER TABLE `order`
  ADD CONSTRAINT `order_ibfk_1` FOREIGN KEY (`fk_userName`) REFERENCES `customer` (`userName`);

--
-- Constraints der Tabelle `orderdetails`
--
ALTER TABLE `orderdetails`
  ADD CONSTRAINT `orderdetails_ibfk_1` FOREIGN KEY (`fk_order_id`) REFERENCES `order` (`order_id`),
  ADD CONSTRAINT `orderdetails_ibfk_2` FOREIGN KEY (`fk_item_id`) REFERENCES `items-stock` (`item_id`),
  ADD CONSTRAINT `orderdetails_ibfk_3` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`);

--
-- Constraints der Tabelle `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `payment_ibfk_1` FOREIGN KEY (`fk_payOpt_id`) REFERENCES `paymentoptions` (`payOpt_id`),
  ADD CONSTRAINT `payment_ibfk_2` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`),
  ADD CONSTRAINT `payment_ibfk_3` FOREIGN KEY (`fk_payOpt_id`) REFERENCES `paymentoptions` (`payOpt_id`);

--
-- Constraints der Tabelle `paymentoptions`
--
ALTER TABLE `paymentoptions`
  ADD CONSTRAINT `paymentoptions_ibfk_1` FOREIGN KEY (`fk_userName`) REFERENCES `customer` (`userName`);

--
-- Constraints der Tabelle `paypal`
--
ALTER TABLE `paypal`
  ADD CONSTRAINT `paypal_ibfk_1` FOREIGN KEY (`fk_payOpt_id`) REFERENCES `paymentoptions` (`payOpt_id`);

--
-- Constraints der Tabelle `shipping`
--
ALTER TABLE `shipping`
  ADD CONSTRAINT `shipping_ibfk_1` FOREIGN KEY (`fk_invoice_id`) REFERENCES `invoice` (`invoice_id`);

--
-- Constraints der Tabelle `supplier`
--
ALTER TABLE `supplier`
  ADD CONSTRAINT `supplier_ibfk_1` FOREIGN KEY (`fk_zip`) REFERENCES `area` (`zip`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
