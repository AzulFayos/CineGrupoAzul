ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'root';
ALTER USER 'default'@'%' IDENTIFIED WITH mysql_native_password BY 'secret';
create database if not exists laravel;

-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema laravel
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema laravel
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `laravel` DEFAULT CHARACTER SET utf8 ;
USE `laravel` ;

-- -----------------------------------------------------
-- Table `laravel`.`cities`
-- -----------------------------------------------------
drop table if exists cities;

CREATE TABLE IF NOT EXISTS `laravel`.`cities` (
  `idCity` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(50) NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `countries_idCountry` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idCity`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

insert into cities (idCity, city, countries_idCountry, lastUpdate) values (1, 'lobortis est', 1, '2020-12-15 12:59:19');
insert into cities (idCity, city, countries_idCountry, lastUpdate) values (2, 'proin leo', 2, '2021-04-06 01:40:32');
insert into cities (idCity, city, countries_idCountry, lastUpdate) values (3, 'in faucibus', 3, '2021-03-07 12:10:02');
insert into cities (idCity, city, countries_idCountry, lastUpdate) values (4, 'erat', 4, '2021-03-17 16:35:29');
insert into cities (idCity, city, countries_idCountry, lastUpdate) values (5, 'nec dui', 5, '2021-03-10 17:09:39');
insert into cities (idCity, city, countries_idCountry, lastUpdate) values (6, 'erat', 6, '2020-08-19 22:30:25');
insert into cities (idCity, city, countries_idCountry, lastUpdate) values (7, 'elementum in', 7, '2020-08-04 07:29:04');
insert into cities (idCity, city, countries_idCountry, lastUpdate) values (8, 'curae', 8, '2020-09-12 06:31:46');
insert into cities (idCity, city, countries_idCountry, lastUpdate) values (9, 'vestibulum', 9, '2020-06-22 11:44:07');
insert into cities (idCity, city, countries_idCountry, lastUpdate) values (10, 'volutpat dui', 10, '2020-07-11 11:02:23');
-- -----------------------------------------------------
-- Table `laravel`.`address`
-- -----------------------------------------------------
drop table if exists addresses;

CREATE TABLE IF NOT EXISTS `laravel`.`addresses` (
  `idAddress` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(50) NOT NULL,
  `address2` VARCHAR(50) NULL DEFAULT NULL,
  `district` VARCHAR(20) NOT NULL,
  `postalCode` VARCHAR(10) NULL DEFAULT NULL,
  `phone` BIGINT NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `country` VARCHAR(60) NOT NULL,
  `cities_idCity` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idAddress`),
  INDEX `address_cities_idcity_foreign` (`cities_idCity` ASC) VISIBLE,
  CONSTRAINT `address_cities_idcity_foreign`
    FOREIGN KEY (`cities_idCity`)
    REFERENCES `laravel`.`cities` (`idCity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

insert into addresses (idAddress, address, address2, district, postalCode, phone, lastUpdate, country, cities_idCity) values (1, 'ENMufqa', 'L6BGC3', 'ut nulla sed', '981', 1552727818, '2020-10-25 05:46:54', 'ante', 1);
insert into addresses (idAddress, address, address2, district, postalCode, phone, lastUpdate, country, cities_idCity) values (2, 'TIzobh', 'TjILlVU', 'interdum venenatis', '44', 2524559238, '2020-05-14 09:53:39', 'sapien in', 2);
insert into addresses (idAddress, address, address2, district, postalCode, phone, lastUpdate, country, cities_idCity) values (3, 'GLGftX', '9VsmZmq6zj', 'orci luctus', '2668', 7552596219, '2021-02-23 04:27:59', 'ipsum primis', 3);
insert into addresses (idAddress, address, address2, district, postalCode, phone, lastUpdate, country, cities_idCity) values (4, 'rsETbhbLLh', 'gTvuLjAXh0bY', 'sollicitudin', '8', 1629423742, '2021-03-06 03:45:54', 'at', 4);
insert into addresses (idAddress, address, address2, district, postalCode, phone, lastUpdate, country, cities_idCity) values (5, 'mj5LRkMpX', 'On5w9Q0u', 'ligula', '258', 1936702820, '2020-08-25 23:46:28', 'vel pede morbi', 5);
insert into addresses (idAddress, address, address2, district, postalCode, phone, lastUpdate, country, cities_idCity) values (6, 'QaZGSU18G', 'sEvIfBggYqdb', 'eget vulputate', '53', 4711452747, '2020-08-10 09:19:12', 'imperdiet', 6);
insert into addresses (idAddress, address, address2, district, postalCode, phone, lastUpdate, country, cities_idCity) values (7, 'qiBuG1P', 'S2Mloz', 'fusce consequat', '94', 8284247769, '2020-08-31 14:39:33', 'nulla', 7);
insert into addresses (idAddress, address, address2, district, postalCode, phone, lastUpdate, country, cities_idCity) values (8, 'lbSSMC', 'nTYVPsqUw0', 'morbi a ipsum', '40', 1028310093, '2021-01-02 17:57:06', 'sapien varius ut', 8);
insert into addresses (idAddress, address, address2, district, postalCode, phone, lastUpdate, country, cities_idCity) values (9, 'UzuKihdWClTY', 'rGe8X23h', 'pulvinar nulla', '2', 4011024394, '2020-12-19 12:30:51', 'primis in', 9);
insert into addresses (idAddress, address, address2, district, postalCode, phone, lastUpdate, country, cities_idCity) values (10, '1VGfMlMbDL', 'YCEM3mWe', 'eleifend luctus', '1', 5811078288, '2020-08-27 23:21:47', 'posuere nonummy integer', 10);

-- -----------------------------------------------------
-- Table `laravel`.`users`
-- -----------------------------------------------------
drop table if exists users;

CREATE TABLE IF NOT EXISTS `laravel`.`users` (
  `idUser` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `email_verified_at` TIMESTAMP NULL DEFAULT NULL,
  `password` VARCHAR(255) NOT NULL,
  `remember_token` VARCHAR(100) NULL DEFAULT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  `updated_at` TIMESTAMP NULL DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE INDEX `users_email_unique` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

insert into users (idUser, `name`, email, `password`, created_at) values (1, 'Ezmeralda', 'eeliet0@soup.io', 'KpBpmsYgi5w', '2021-03-10 21:00:11');
insert into users (idUser, `name`, email, `password`, created_at) values (2, 'Tiphani', 'tmcmychem1@tinypic.com', 'x3TnA63S', '2020-08-21 21:17:49');
insert into users (idUser, `name`, email, `password`, created_at) values (3, 'Modestine', 'mwhymark2@whitehouse.gov', 'E39sHo13CI', '2021-01-15 00:37:07');
insert into users (idUser, `name`, email, `password`, created_at) values (4, 'Ruttger', 'rhares3@cafepress.com', 'hAozZQ3IP', '2021-03-24 13:49:53');
insert into users (idUser, `name`, email, `password`, created_at) values (5, 'Eduino', 'ebennen4@slashdot.org', 'WHKBMGBmEfR', '2021-03-14 04:56:34');
insert into users (idUser, `name`, email, `password`, created_at) values (6, 'Alexia', 'afulep5@mysql.com', 'vS0kswL', '2020-09-12 03:35:40');
insert into users (idUser, `name`, email, `password`, created_at) values (7, 'Lacey', 'lyeandel6@businessinsider.com', '1dY6w7', '2020-07-01 07:28:10');
insert into users (idUser, `name`, email, `password`, created_at) values (8, 'Joice', 'jburle7@lulu.com', 'nrQHbkY2Y', '2020-06-09 00:35:37');
insert into users (idUser, `name`, email, `password`, created_at) values (9, 'Roshelle', 'rshard8@hexun.com', 'uLkf15fAp', '2021-03-16 19:20:59');
insert into users (idUser, `name`, email, `password`, created_at) values (10, 'Catherina', 'csandland9@walmart.com', '2JLCjcBlwv', '2020-07-09 08:46:59');
-- -----------------------------------------------------
-- Table `laravel`.`customers`
-- -----------------------------------------------------
drop table if exists customers;

CREATE TABLE IF NOT EXISTS `laravel`.`customers` (
  `idCustomer` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `createDate` DATETIME NOT NULL,
  `address_idAddress` SMALLINT UNSIGNED NOT NULL,
  `users_idUser` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idCustomer`),
  INDEX `fk_customers_address1_idx` (`address_idAddress` ASC) VISIBLE,
  INDEX `fk_customers_users1_idx` (`users_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_customers_address1`
    FOREIGN KEY (`address_idAddress`)
    REFERENCES `laravel`.`address` (`idAddress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_customers_users1`
    FOREIGN KEY (`users_idUser`)
    REFERENCES `laravel`.`users` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

insert into customers (idCustomer, firstName, lastName, createDate, address_idAddress, users_idUser) values (1, 'Breena', 'Romayn', '2020-09-10 06:17:34', 1, 1);
insert into customers (idCustomer, firstName, lastName, createDate, address_idAddress, users_idUser) values (2, 'Marissa', 'Cissell', '2020-09-17 09:58:16', 2, 2);
insert into customers (idCustomer, firstName, lastName, createDate, address_idAddress, users_idUser) values (3, 'Valentina', 'Armstead', '2020-05-12 06:52:05', 3, 3);
insert into customers (idCustomer, firstName, lastName, createDate, address_idAddress, users_idUser) values (4, 'Barclay', 'Hillum', '2020-12-15 10:32:21', 4, 4);
insert into customers (idCustomer, firstName, lastName, createDate, address_idAddress, users_idUser) values (5, 'Ryan', 'Mullenger', '2020-11-14 21:08:24', 5, 5);
insert into customers (idCustomer, firstName, lastName, createDate, address_idAddress, users_idUser) values (6, 'Orsola', 'MacKibbon', '2020-06-17 06:39:01', 6, 6);
insert into customers (idCustomer, firstName, lastName, createDate, address_idAddress, users_idUser) values (7, 'Kassia', 'Skinley', '2020-06-06 10:50:39', 7, 7);
insert into customers (idCustomer, firstName, lastName, createDate, address_idAddress, users_idUser) values (8, 'Shirl', 'Stefi', '2020-10-01 03:02:32', 8, 8);
insert into customers (idCustomer, firstName, lastName, createDate, address_idAddress, users_idUser) values (9, 'Eleen', 'Tomet', '2020-07-06 10:59:50', 9, 9);
insert into customers (idCustomer, firstName, lastName, createDate, address_idAddress, users_idUser) values (10, 'Thane', 'Birdall', '2020-07-03 03:07:08', 10, 10);

-- -----------------------------------------------------
-- Table `laravel`.`Halls`
-- -----------------------------------------------------
drop table if exists Halls;

CREATE TABLE IF NOT EXISTS `laravel`.`halls` (
  `idHall` TINYINT UNSIGNED NOT NULL,
  `hallNumber` TINYINT NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idHall`),
  UNIQUE INDEX `idHall_UNIQUE` (`idHall` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

insert into halls (idHall, hallNumber, lastUpdate) values (1, 1, '2020-07-18 11:07:55');
insert into halls (idHall, hallNumber, lastUpdate) values (2, 2, '2020-09-30 11:18:15');
insert into halls (idHall, hallNumber, lastUpdate) values (3, 3, '2020-11-18 20:00:29');
insert into halls (idHall, hallNumber, lastUpdate) values (4, 4, '2020-08-11 14:52:07');
insert into halls (idHall, hallNumber, lastUpdate) values (5, 5, '2021-02-09 12:30:07');
insert into halls (idHall, hallNumber, lastUpdate) values (6, 6, '2021-03-03 21:13:50');
insert into halls (idHall, hallNumber, lastUpdate) values (7, 7, '2020-12-03 15:36:20');
insert into halls (idHall, hallNumber, lastUpdate) values (8, 8, '2021-01-30 16:11:22');
insert into halls (idHall, hallNumber, lastUpdate) values (9, 9, '2021-03-27 02:29:28');
insert into halls (idHall, hallNumber, lastUpdate) values (10, 10, '2021-03-06 14:49:50');
-- -----------------------------------------------------
-- Table `laravel`.`stores`
-- -----------------------------------------------------
drop table if exists `laravel`.`stores`;

CREATE TABLE IF NOT EXISTS `laravel`.`stores` (
  `idStore` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `storeName` VARCHAR(45) NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address_idAddress` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idStore`),
  INDEX `fk_stores_address1_idx` (`address_idAddress` ASC) VISIBLE,
  CONSTRAINT `fk_stores_address1`
    FOREIGN KEY (`address_idAddress`)
    REFERENCES `laravel`.`address` (`idAddress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

insert into stores (idStore, storeName, lastUpdate, address_idAddress) values (1, 'McClure, Fay and Tillman', '2021-03-27 19:48:39', 1);
insert into stores (idStore, storeName, lastUpdate, address_idAddress) values (2, 'Sipes and Sons', '2021-02-14 07:36:23', 2);
insert into stores (idStore, storeName, lastUpdate, address_idAddress) values (3, 'Boyer, O''Reilly and Harber', '2021-04-04 06:12:21', 3);
insert into stores (idStore, storeName, lastUpdate, address_idAddress) values (4, 'Rolfson and Sons', '2021-03-07 16:39:46', 4);
insert into stores (idStore, storeName, lastUpdate, address_idAddress) values (5, 'VonRueden LLC', '2020-06-22 11:00:46', 5);
insert into stores (idStore, storeName, lastUpdate, address_idAddress) values (6, 'Kub-Mueller', '2020-10-24 07:26:35', 6);
insert into stores (idStore, storeName, lastUpdate, address_idAddress) values (7, 'Cruickshank-Wolf', '2020-12-30 14:58:46', 7);
insert into stores (idStore, storeName, lastUpdate, address_idAddress) values (8, 'Swift-Fadel', '2020-12-01 14:13:43', 8);
insert into stores (idStore, storeName, lastUpdate, address_idAddress) values (9, 'Flatley, Kessler and Armstrong', '2020-08-09 16:24:35', 9);
insert into stores (idStore, storeName, lastUpdate, address_idAddress) values (10, 'Daugherty, Abbott and Dicki', '2020-09-14 07:07:37', 10);
-- -----------------------------------------------------
-- Table `laravel`.`payments`
-- -----------------------------------------------------
drop table if exists payments;

CREATE TABLE IF NOT EXISTS `laravel`.`payments` (
  `idPayment` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `amount` DECIMAL(5,2) NOT NULL,
  `paymentDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `staffs_idStaff` TINYINT UNSIGNED NOT NULL,
  `types_idtype` INT NOT NULL,
  `stores_idStore` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idPayment`),
  INDEX `fk_payments_stores1_idx` (`stores_idStore` ASC) VISIBLE,
  CONSTRAINT `fk_payments_stores1`
    FOREIGN KEY (`stores_idStore`)
    REFERENCES `laravel`.`stores` (`idStore`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

insert into payments (idPayment, amount, paymentDate, lastUpdate, staffs_idStaff, types_idtype, stores_idStore) values (1, 80.54, '2020-06-05 05:07:16', '2020-09-20 21:34:40', 1, 1, 1);
insert into payments (idPayment, amount, paymentDate, lastUpdate, staffs_idStaff, types_idtype, stores_idStore) values (2, 8.49, '2020-11-23 11:47:51', '2020-10-30 17:07:50', 2, 2, 2);
insert into payments (idPayment, amount, paymentDate, lastUpdate, staffs_idStaff, types_idtype, stores_idStore) values (3, 33.66, '2020-06-02 22:05:46', '2021-02-09 03:44:51', 3, 3, 3);
insert into payments (idPayment, amount, paymentDate, lastUpdate, staffs_idStaff, types_idtype, stores_idStore) values (4, 94.75, '2020-12-29 23:10:17', '2020-12-17 10:32:03', 4, 4, 4);
insert into payments (idPayment, amount, paymentDate, lastUpdate, staffs_idStaff, types_idtype, stores_idStore) values (5, 25.83, '2020-05-01 23:39:46', '2021-04-16 23:36:37', 5, 5, 5);
insert into payments (idPayment, amount, paymentDate, lastUpdate, staffs_idStaff, types_idtype, stores_idStore) values (6, 50.67, '2021-01-21 06:33:12', '2020-11-13 10:13:33', 6, 6, 6);
insert into payments (idPayment, amount, paymentDate, lastUpdate, staffs_idStaff, types_idtype, stores_idStore) values (7, 56.05, '2021-03-11 21:13:32', '2021-04-15 03:39:29', 7, 7, 7);
insert into payments (idPayment, amount, paymentDate, lastUpdate, staffs_idStaff, types_idtype, stores_idStore) values (8, 31.95, '2020-08-19 16:55:10', '2020-07-04 19:57:14', 8, 8, 8);
insert into payments (idPayment, amount, paymentDate, lastUpdate, staffs_idStaff, types_idtype, stores_idStore) values (9, 62.19, '2020-11-01 01:06:32', '2021-04-04 16:19:12', 9, 9, 9);
insert into payments (idPayment, amount, paymentDate, lastUpdate, staffs_idStaff, types_idtype, stores_idStore) values (10, 52.19, '2021-02-06 01:53:59', '2021-04-05 22:27:20', 10, 10, 10);

-- -----------------------------------------------------
-- Table `laravel`.`marathones`
-- -----------------------------------------------------
drop table if exists marathones;

CREATE TABLE IF NOT EXISTS `laravel`.`marathones` (
  `idMarathones` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `titleMovie` VARCHAR(300) NOT NULL,
  `marathonRuntime` INT NOT NULL,
  `synopsis` LONGTEXT NOT NULL,
  `marathonRating` DOUBLE NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payments_idPayment` BIGINT UNSIGNED NOT NULL,
  `marathonCategory` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMarathones`),
  INDEX `fk_marathones_payments1_idx` (`payments_idPayment` ASC) VISIBLE,
  CONSTRAINT `fk_marathones_payments1`
    FOREIGN KEY (`payments_idPayment`)
    REFERENCES `laravel`.`payments` (`idPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

insert into marathones (idMarathones, titleMovie, marathonRuntime, synopsis, marathonRating, lastUpdate, payments_idPayment, marathonCategory) values (1, 'ligula sit amet', 374, 'convallis', 5, '2020-06-05 01:32:58', 1, 'donec');
insert into marathones (idMarathones, titleMovie, marathonRuntime, synopsis, marathonRating, lastUpdate, payments_idPayment, marathonCategory) values (2, 'odio cras', 108, 'semper sapien a libero', 10, '2020-08-26 16:31:26', 2, 'volutpat dui');
insert into marathones (idMarathones, titleMovie, marathonRuntime, synopsis, marathonRating, lastUpdate, payments_idPayment, marathonCategory) values (3, 'non mauris morbi non lectus', 108, 'non interdum', 9, '2020-10-29 08:38:24', 3, 'placerat praesent');
insert into marathones (idMarathones, titleMovie, marathonRuntime, synopsis, marathonRating, lastUpdate, payments_idPayment, marathonCategory) values (4, 'in sagittis dui', 132, 'sapien a libero nam dui', 7, '2021-04-03 00:16:58', 4, 'id mauris');
insert into marathones (idMarathones, titleMovie, marathonRuntime, synopsis, marathonRating, lastUpdate, payments_idPayment, marathonCategory) values (5, 'aliquam convallis', 257, 'ultrices vel augue vestibulum ante', 7, '2020-06-24 16:19:20', 5, 'aliquam augue');
insert into marathones (idMarathones, titleMovie, marathonRuntime, synopsis, marathonRating, lastUpdate, payments_idPayment, marathonCategory) values (6, 'adipiscing lorem', 438, 'scelerisque quam turpis adipiscing lorem', 4, '2020-08-15 01:13:46', 6, 'ullamcorper');
insert into marathones (idMarathones, titleMovie, marathonRuntime, synopsis, marathonRating, lastUpdate, payments_idPayment, marathonCategory) values (7, 'fusce', 449, 'pharetra magna ac consequat', 5, '2020-09-26 14:48:00', 7, 'ligula');
insert into marathones (idMarathones, titleMovie, marathonRuntime, synopsis, marathonRating, lastUpdate, payments_idPayment, marathonCategory) values (8, 'est lacinia nisi venenatis tristique', 466, 'odio', 2, '2020-05-19 09:19:15', 8, 'lacus');
insert into marathones (idMarathones, titleMovie, marathonRuntime, synopsis, marathonRating, lastUpdate, payments_idPayment, marathonCategory) values (9, 'pellentesque', 165, 'orci', 4, '2020-10-04 23:54:57', 9, 'risus');
insert into marathones (idMarathones, titleMovie, marathonRuntime, synopsis, marathonRating, lastUpdate, payments_idPayment, marathonCategory) values (10, 'ut', 132, 'velit vivamus', 9, '2020-08-09 09:50:42', 10, 'ac consequat');
-- -----------------------------------------------------
-- Table `laravel`.`movies`
-- -----------------------------------------------------
drop table if exists movies;

CREATE TABLE IF NOT EXISTS `laravel`.`movies` (
  `idMovie` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `titleMovie` VARCHAR(300) NOT NULL,
  `movieRuntime` INT NOT NULL,
  `synopsis` LONGTEXT NOT NULL,
  `movieReleaseDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `movieCertificate` ENUM('N/A', 'PG', '12', '18', '12A', '15', '15A', '16') NOT NULL,
  `movieRating` DOUBLE NULL DEFAULT NULL,
  `original_language_id` TINYINT NOT NULL,
  `specialFeatures` VARCHAR(500) NULL DEFAULT NULL,
  `lastUpdate` TIMESTAMP NOT NULL,
  `languages_idLanguage` TINYINT NOT NULL,
  `actors` VARCHAR(45) NOT NULL,
  `languages` VARCHAR(10) NOT NULL,
  `movieCategory` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idMovie`),
  INDEX `idLanguage_idx` (`original_language_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

insert into movies (idMovie, titleMovie, movieRuntime, synopsis, movieReleaseDate, movieCertificate, movieRating, original_language_id, specialFeatures, lastUpdate, languages_idLanguage, actors, languages, movieCategory) values (1, 'Pocahontas II: Journey to a New World ', 471, 'nunc commodo', '2021-02-11 03:23:19', '12', 3, 1, 'Tully', '2021-02-15 14:52:13', 1, 'Tully Aizikovich', 'Catalan', 'Adventure|Animation|Children');
insert into movies (idMovie, titleMovie, movieRuntime, synopsis, movieReleaseDate, movieCertificate, movieRating, original_language_id, specialFeatures, lastUpdate, languages_idLanguage, actors, languages, movieCategory) values (2, 'Mummy''s Hand, The', 358, 'felis sed', '2020-07-20 01:07:22', '12', 7, 2, 'Polly', '2020-07-25 08:07:08', 2, 'Polly Sebley', 'Arabic', 'Horror');
insert into movies (idMovie, titleMovie, movieRuntime, synopsis, movieReleaseDate, movieCertificate, movieRating, original_language_id, specialFeatures, lastUpdate, languages_idLanguage, actors, languages, movieCategory) values (3, 'South Pacific', 279, 'odio curabitur convallis', '2020-10-09 04:38:30', '12', 3, 3, 'Obediah', '2021-04-04 15:36:33', 3, 'Obediah Blodgett', 'Quechua', 'Musical|Romance|War');
insert into movies (idMovie, titleMovie, movieRuntime, synopsis, movieReleaseDate, movieCertificate, movieRating, original_language_id, specialFeatures, lastUpdate, languages_idLanguage, actors, languages, movieCategory) values (4, 'Why Don''t You Play In Hell? (Jigoku de naze warui)', 493, 'posuere metus', '2020-10-20 23:31:42', '12', 10, 4, 'Katy', '2020-07-22 05:52:50', 4, 'Katy Greatrex', 'Kazakh', 'Action|Drama');
insert into movies (idMovie, titleMovie, movieRuntime, synopsis, movieReleaseDate, movieCertificate, movieRating, original_language_id, specialFeatures, lastUpdate, languages_idLanguage, actors, languages, movieCategory) values (5, 'Tupac: Resurrection', 269, 'consectetuer eget rutrum at lorem', '2021-03-05 12:19:33', '12', 8, 5, 'Felipa', '2020-06-07 08:38:04', 5, 'Felipa Hynam', 'Georgian', 'Documentary');
insert into movies (idMovie, titleMovie, movieRuntime, synopsis, movieReleaseDate, movieCertificate, movieRating, original_language_id, specialFeatures, lastUpdate, languages_idLanguage, actors, languages, movieCategory) values (6, 'Feast at Midnight, A', 333, 'mi in porttitor', '2020-10-20 18:26:45', '12', 8, 6, 'Onofredo', '2020-09-29 14:07:28', 6, 'Onofredo Allwood', 'Northern', 'Children|Comedy|Drama');
insert into movies (idMovie, titleMovie, movieRuntime, synopsis, movieReleaseDate, movieCertificate, movieRating, original_language_id, specialFeatures, lastUpdate, languages_idLanguage, actors, languages, movieCategory) values (7, 'Black Sabbath (Tre volti della paura, I)', 392, 'rhoncus sed vestibulum', '2021-04-22 23:19:42', '12', 6, 7, 'Merl', '2020-05-07 16:01:00', 7, 'Merl D''Ambrosi', 'Filipino', 'Horror');
insert into movies (idMovie, titleMovie, movieRuntime, synopsis, movieReleaseDate, movieCertificate, movieRating, original_language_id, specialFeatures, lastUpdate, languages_idLanguage, actors, languages, movieCategory) values (8, 'Big Bully', 396, 'porta volutpat quam pede', '2020-06-17 22:18:51', '12', 2, 8, 'Peadar', '2020-09-07 22:25:13', 8, 'Peadar Hussey', 'HiriMotu', 'Comedy|Drama');
insert into movies (idMovie, titleMovie, movieRuntime, synopsis, movieReleaseDate, movieCertificate, movieRating, original_language_id, specialFeatures, lastUpdate, languages_idLanguage, actors, languages, movieCategory) values (9, 'Sammy and Rosie Get Laid', 435, 'rutrum ac lobortis', '2021-02-03 01:35:55', '12', 3, 9, 'Demetri', '2021-02-14 22:22:54', 9, 'Demetri Gillespey', 'Aymara', 'Comedy|Drama');
insert into movies (idMovie, titleMovie, movieRuntime, synopsis, movieReleaseDate, movieCertificate, movieRating, original_language_id, specialFeatures, lastUpdate, languages_idLanguage, actors, languages, movieCategory) values (10, 'Blast of Silence', 119, 'lorem', '2021-02-07 04:14:48', '12', 7, 10, 'Mace', '2021-03-22 13:31:46', 10, 'Mace Keher', 'Telugu', 'Crime|Drama|Thriller');
-- -----------------------------------------------------
-- Table `laravel`.`posters`
-- -----------------------------------------------------

drop table if exists posters; 

CREATE TABLE IF NOT EXISTS `laravel`.`posters` (
  `idPoster` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `posterName` VARCHAR(100) NOT NULL,
  `movies_idMovie` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idPoster`),
  INDEX `fk_posters_movies1_idx` (`movies_idMovie` ASC) VISIBLE,
  CONSTRAINT `fk_posters_movies1`
    FOREIGN KEY (`movies_idMovie`)
    REFERENCES `laravel`.`movies` (`idMovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

insert into posters (idPoster, lastUpdate, posterName, movies_idMovie) values (1, '2020-06-05 05:07:16', 'Bloodsucking Freaks', 1);
insert into posters (idPoster, lastUpdate, posterName, movies_idMovie) values (2, '2020-06-05 05:07:16', 'Talk of the Town, The', 2);
insert into posters (idPoster, lastUpdate, posterName, movies_idMovie) values (3, '2020-06-05 05:07:16', 'Blood Night: The Legend of Mary Hatchet (Blood Night)', 3);
insert into posters (idPoster, lastUpdate, posterName, movies_idMovie) values (4, '2020-06-05 05:07:16', 'Dimensions of Dialogue (Moznosti dialogu)', 4);
insert into posters (idPoster, lastUpdate, posterName, movies_idMovie) values (5, '2020-06-05 05:07:16', 'Sexual Dependency (Dependencia sexual)', 5);
insert into posters (idPoster, lastUpdate, posterName, movies_idMovie) values (6, '2020-06-05 05:07:16', 'Johnny Eager', 6);
insert into posters (idPoster, lastUpdate, posterName, movies_idMovie) values (7, '2020-06-05 05:07:16', 'Where Danger Lives', 7);
insert into posters (idPoster, lastUpdate, posterName, movies_idMovie) values (8, '2020-06-05 05:07:16', 'East, The', 8);
insert into posters (idPoster, lastUpdate, posterName, movies_idMovie) values (9, '2020-06-05 05:07:16', 'Orders Signed in White', 9);
insert into posters (idPoster, lastUpdate, posterName, movies_idMovie) values (10,'2020-06-05 05:07:16', 'Verlorene, Der (Lost One, The)', 10);

-- -----------------------------------------------------
-- Table laravel.Seats
-- -----------------------------------------------------

drop table if exists Seats;

CREATE TABLE IF NOT EXISTS laravel.Seats (
  idSeats INT UNSIGNED NOT NULL AUTO_INCREMENT,
  seatPosition VARCHAR(10) NOT NULL,
  lastUpdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  Halls_idHall TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (idSeats),
  INDEX fk_Seats_Halls1_idx (Halls_idHall ASC) VISIBLE,
  CONSTRAINT fk_Seats_Halls1
    FOREIGN KEY (Halls_idHall)
    REFERENCES laravel.Halls (idHall)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

insert into Seats (idSeats, seatPosition, lastUpdate, Halls_idHall) values (1, 'ae', '2020-11-03 19:00:57', 1);
insert into Seats (idSeats, seatPosition, lastUpdate, Halls_idHall) values (2, 'tu', '2020-10-19 01:21:41', 2);
insert into Seats (idSeats, seatPosition, lastUpdate, Halls_idHall) values (3, 'li', '2020-08-15 16:52:43', 3);
insert into Seats (idSeats, seatPosition, lastUpdate, Halls_idHall) values (4, 'er', '2020-06-23 21:02:57', 4);
insert into Seats (idSeats, seatPosition, lastUpdate, Halls_idHall) values (5, 'he', '2021-01-18 01:58:42', 5);
insert into Seats (idSeats, seatPosition, lastUpdate, Halls_idHall) values (6, 'al', '2021-03-01 09:34:56', 6);
insert into Seats (idSeats, seatPosition, lastUpdate, Halls_idHall) values (7, 'ma', '2020-12-18 03:28:19', 7);
insert into Seats (idSeats, seatPosition, lastUpdate, Halls_idHall) values (8, 'ut', '2020-07-13 07:59:10', 8);
insert into Seats (idSeats, seatPosition, lastUpdate, Halls_idHall) values (9, 'el', '2020-10-02 13:33:43', 9);
insert into Seats (idSeats, seatPosition, lastUpdate, Halls_idHall) values (10, 'bi', '2020-12-30 02:08:08', 10);

-- -----------------------------------------------------
-- Table laravel.events
-- -----------------------------------------------------

drop table if exists `laravel`.`events`;

CREATE TABLE IF NOT EXISTS `laravel`.`events` (
  idEvent INT UNSIGNED NOT NULL AUTO_INCREMENT,
  payments_idPayment BIGINT UNSIGNED NOT NULL,
  synopsis LONGTEXT NOT NULL,
  eventTitle VARCHAR(300) NOT NULL,
  lastUpdate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  eventCategory VARCHAR(200) NOT NULL,
  PRIMARY KEY (idEvent),
  INDEX fk_events_payments_idx (payments_idPayment ASC) VISIBLE,
  CONSTRAINT fk_events_payments
    FOREIGN KEY (payments_idPayment)
    REFERENCES laravel.payments (idPayment)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

insert into events (idEvent, payments_idPayment, synopsis, eventTitle, lastUpdate, eventCategory) values (1,  1, 'etiam vel', 9, '2020-08-09 11:42:12', 'nullam porttitor lacus');
insert into events (idEvent, payments_idPayment, synopsis, eventTitle, lastUpdate, eventCategory) values (2,  2, 'integer aliquet massa id', 1, '2020-05-05 19:28:52', 'habitasse platea dictumst');
insert into events (idEvent, payments_idPayment, synopsis, eventTitle, lastUpdate, eventCategory) values (3,  3, 'pretium', 3, '2020-11-06 09:42:00', 'lobortis convallis tortor risus dapibus');
insert into events (idEvent, payments_idPayment, synopsis, eventTitle, lastUpdate, eventCategory) values (4,  4, 'risus auctor sed tristique', 7, '2021-01-18 09:46:43', 'semper est quam');
insert into events (idEvent, payments_idPayment, synopsis, eventTitle, lastUpdate, eventCategory) values (5,  5, 'penatibus', 1, '2020-06-16 01:37:39', 'orci pede venenatis non');
insert into events (idEvent, payments_idPayment, synopsis, eventTitle, lastUpdate, eventCategory) values (6,  6, 'mauris', 3, '2021-03-28 03:38:39', 'lacus morbi quis tortor');
insert into events (idEvent, payments_idPayment, synopsis, eventTitle, lastUpdate, eventCategory) values (7,  7, 'vestibulum aliquet', 5, '2020-11-27 01:29:54','lacus morbi sem mauris');
insert into events (idEvent, payments_idPayment, synopsis, eventTitle, lastUpdate, eventCategory) values (8,  8, 'magnis dis parturient montes', 6, '2021-03-07 07:43:23','dolor sit amet');
insert into events (idEvent, payments_idPayment, synopsis, eventTitle, lastUpdate, eventCategory) values (9,  9, 'luctus ultricies', 2, '2020-06-20 18:39:20','arcu sed augue aliquam erat');
insert into events (idEvent, payments_idPayment, synopsis, eventTitle, lastUpdate, eventCategory) values (10, 10, 'luctus ultricies', 2, '2020-06-20 18:39:20','arcu sed augue aliquam erat');

-- -----------------------------------------------------
-- Table `laravel`.`tickets`
-- -----------------------------------------------------
drop table if exists tickets;

CREATE TABLE IF NOT EXISTS `laravel`.`tickets` (
  `idTicket` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticketPrice` FLOAT NOT NULL,
  `movies_idMovie` INT UNSIGNED NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payments_idPayment` BIGINT UNSIGNED NOT NULL,
  `customers_idCustomer` BIGINT UNSIGNED NOT NULL,
  `price` FLOAT NOT NULL,
  `discount` FLOAT NOT NULL,
  `ticketValue` FLOAT NOT NULL,
  `ticketName` VARCHAR(200) NOT NULL,
  `description` TEXT NOT NULL,
  `termCondition` TEXT NOT NULL,
  `date` TIMESTAMP NOT NULL,
  `events_idEvent` INT UNSIGNED NOT NULL,
  `marathones_idMarathones` INT UNSIGNED NOT NULL,
  `halls_idHall` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idTicket`),
  INDEX `fk_Tickets_movies_idx` (`movies_idMovie` ASC) VISIBLE,
  INDEX `fk_tickets_payments1_idx` (`payments_idPayment` ASC) VISIBLE,
  INDEX `fk_tickets_customers1_idx` (`customers_idCustomer` ASC) VISIBLE,
  INDEX `fk_tickets_events1_idx` (`events_idEvent` ASC) VISIBLE,
  INDEX `fk_tickets_marathones1_idx` (`marathones_idMarathones` ASC) VISIBLE,
  INDEX `fk_tickets_Halls1_idx` (`halls_idHall` ASC) VISIBLE,
  CONSTRAINT `fk_Tickets_movies`
    FOREIGN KEY (`movies_idMovie`)
    REFERENCES `laravel`.`movies` (`idMovie`),
  CONSTRAINT `fk_tickets_payments1`
    FOREIGN KEY (`payments_idPayment`)
    REFERENCES `laravel`.`payments` (`idPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tickets_customers1`
    FOREIGN KEY (`customers_idCustomer`)
    REFERENCES `laravel`.`customers` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tickets_events1`
    FOREIGN KEY (`events_idEvent`)
    REFERENCES `laravel`.`events` (`idEvent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tickets_marathones1`
    FOREIGN KEY (`marathones_idMarathones`)
    REFERENCES `laravel`.`marathones` (`idMarathones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tickets_Halls1`
    FOREIGN KEY (`halls_idHall`)
    REFERENCES `laravel`.`Halls` (`idHall`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

insert into tickets (idTicket, ticketPrice, movies_idMovie, lastUpdate, payments_idPayment, customers_idCustomer, price, discount, ticketValue, ticketName, `description`, termCondition, `date`, events_idEvent, marathones_idMarathones, halls_idHall) values (1, 10.00, 1, '2020-06-10 02:54:11', 1, 1, 48.27, 38.21, 64.43, 'vel augue vestibulum ante ipsum primis in', 'nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non', 'velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante', '2021-03-28 03:38:39', 1, 1, 1);
insert into tickets (idTicket, ticketPrice, movies_idMovie, lastUpdate, payments_idPayment, customers_idCustomer, price, discount, ticketValue, ticketName, `description`, termCondition, `date`, events_idEvent, marathones_idMarathones, halls_idHall) values (2, 55.03, 2, '2020-08-09 02:48:46', 2, 2, 47.79, 22.81, 25.48, 'quis lectus suspendisse potenti', 'ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas', 'congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede', '2021-03-28 03:38:39', 2, 2, 2);
insert into tickets (idTicket, ticketPrice, movies_idMovie, lastUpdate, payments_idPayment, customers_idCustomer, price, discount, ticketValue, ticketName, `description`, termCondition, `date`, events_idEvent, marathones_idMarathones, halls_idHall) values (3, 59.3, 3, '2020-08-20 09:11:40', 3, 3, 98.13, 69.53, 30.36, 'mauris enim leo rhoncus sed', 'at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis', 'in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam', '2021-03-28 03:38:39', 3, 3, 3);
insert into tickets (idTicket, ticketPrice, movies_idMovie, lastUpdate, payments_idPayment, customers_idCustomer, price, discount, ticketValue, ticketName, `description`, termCondition, `date`, events_idEvent, marathones_idMarathones, halls_idHall) values (4, 70.6, 4, '2021-03-10 04:44:27', 4, 4, 98.43, 33.97, 74.98, 'mauris', 'consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus', 'eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in', '2021-03-28 03:38:39', 4, 4, 4);
insert into tickets (idTicket, ticketPrice, movies_idMovie, lastUpdate, payments_idPayment, customers_idCustomer, price, discount, ticketValue, ticketName, `description`, termCondition, `date`, events_idEvent, marathones_idMarathones, halls_idHall) values (5, 26.84, 5, '2021-03-24 00:42:47', 5, 5, 57.29, 88.34, 19.27, 'at dolor quis odio consequat varius integer ac leo', 'eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus', 'lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus', '2021-03-28 03:38:39', 5, 5, 5);
insert into tickets (idTicket, ticketPrice, movies_idMovie, lastUpdate, payments_idPayment, customers_idCustomer, price, discount, ticketValue, ticketName, `description`, termCondition, `date`, events_idEvent, marathones_idMarathones, halls_idHall) values (6, 26.84, 6, '2021-03-24 00:42:47', 6, 6, 57.29, 88.34, 19.27, 'at dolor quis odio consequat varius integer ac leo', 'eleifend luctus ultricies eu nibh quisque id justo sit amet sapien dignissim vestibulum vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae nulla dapibus dolor vel est donec odio justo sollicitudin ut suscipit a feugiat et eros vestibulum ac est lacinia nisi venenatis tristique fusce congue diam id ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu sed augue aliquam erat volutpat in congue etiam justo etiam pretium iaculis justo in hac habitasse platea dictumst etiam faucibus', 'lectus vestibulum quam sapien varius ut blandit non interdum in ante vestibulum ante ipsum primis in faucibus orci luctus', '2021-03-28 03:38:39', 6, 6, 6);
insert into tickets (idTicket, ticketPrice, movies_idMovie, lastUpdate, payments_idPayment, customers_idCustomer, price, discount, ticketValue, ticketName, `description`, termCondition, `date`, events_idEvent, marathones_idMarathones, halls_idHall) values (7, 89.4, 7, '2020-06-10 02:54:11', 7, 7, 48.27, 38.21, 64.43, 'vel augue vestibulum ante ipsum primis in', 'nibh ligula nec sem duis aliquam convallis nunc proin at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum eget vulputate ut ultrices vel augue vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae donec pharetra magna vestibulum aliquet ultrices erat tortor sollicitudin mi sit amet lobortis sapien sapien non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel nisl duis ac nibh fusce lacus purus aliquet at feugiat non', 'velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante', '2021-03-28 03:38:39', 7, 7, 7);
insert into tickets (idTicket, ticketPrice, movies_idMovie, lastUpdate, payments_idPayment, customers_idCustomer, price, discount, ticketValue, ticketName, `description`, termCondition, `date`, events_idEvent, marathones_idMarathones, halls_idHall) values (8, 55.03, 8, '2020-08-09 02:48:46', 8, 8, 47.79, 22.81, 25.48, 'quis lectus suspendisse potenti', 'ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus tortor duis mattis egestas', 'congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede', '2021-03-28 03:38:39', 8, 8, 8);
insert into tickets (idTicket, ticketPrice, movies_idMovie, lastUpdate, payments_idPayment, customers_idCustomer, price, discount, ticketValue, ticketName, `description`, termCondition, `date`, events_idEvent, marathones_idMarathones, halls_idHall) values (9, 59.3, 9, '2020-08-20 09:11:40', 9, 9, 98.13, 69.53, 30.36, 'mauris enim leo rhoncus sed', 'at lorem integer tincidunt ante vel ipsum praesent blandit lacinia erat vestibulum sed magna at nunc commodo placerat praesent blandit nam nulla integer pede justo lacinia eget tincidunt eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis', 'in faucibus orci luctus et ultrices posuere cubilia curae mauris viverra diam', '2021-03-28 03:38:39', 9, 9, 9);
insert into tickets (idTicket, ticketPrice, movies_idMovie, lastUpdate, payments_idPayment, customers_idCustomer, price, discount, ticketValue, ticketName, `description`, termCondition, `date`, events_idEvent, marathones_idMarathones, halls_idHall) values (10, 70.6, 10, '2021-03-10 04:44:27', 10, 10, 98.43, 33.97, 74.98, 'mauris', 'consequat lectus in est risus auctor sed tristique in tempus sit amet sem fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis enim blandit mi in porttitor pede justo eu massa donec dapibus duis at velit eu est congue elementum in hac habitasse platea dictumst morbi vestibulum velit id pretium iaculis diam erat fermentum justo nec condimentum neque sapien placerat ante nulla justo aliquam quis turpis eget elit sodales scelerisque mauris sit amet eros suspendisse accumsan tortor quis turpis sed ante vivamus', 'eget tempus vel pede morbi porttitor lorem id ligula suspendisse ornare consequat lectus in', '2021-03-28 03:38:39', 10, 10, 10);

-- -----------------------------------------------------
-- Table `laravel`.`failedJobs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`failedJobs` (
  `idFailedJobs` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` VARCHAR(255) NOT NULL,
  `connection` TEXT NOT NULL,
  `queue` TEXT NOT NULL,
  `payload` LONGTEXT NOT NULL,
  `exception` LONGTEXT NOT NULL,
  `failedAT` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idFailedJobs`),
  UNIQUE INDEX `failed_jobs_uuid_unique` (`uuid` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `laravel`.`migrations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`migrations` (
  `idMigrations` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` VARCHAR(255) NOT NULL,
  `batch` INT NOT NULL,
  PRIMARY KEY (`idMigrations`))
ENGINE = InnoDB
AUTO_INCREMENT = 4
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;


-- -----------------------------------------------------
-- Table `laravel`.`passwordResets`
-- -----------------------------------------------------


CREATE TABLE IF NOT EXISTS `laravel`.`passwordResets` (
  `email` VARCHAR(255) NOT NULL,
  `token` VARCHAR(255) NOT NULL,
  `created_at` TIMESTAMP NULL DEFAULT NULL,
  INDEX `password_resets_email_index` (`email` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_unicode_ci;

-- -----------------------------------------------------
-- Table `laravel`.`trailers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`trailers` (
  `idTrailer` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `trailerURL` VARCHAR(500) NOT NULL,
  `trailerURL2` VARCHAR(500) NULL DEFAULT NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `trailerLanguage` VARCHAR(10) NOT NULL,
  `movies_idMovie` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idTrailer`),
  INDEX `fk_trailers_movies1_idx` (`movies_idMovie` ASC) VISIBLE,
  CONSTRAINT `fk_trailers_movies1`
    FOREIGN KEY (`movies_idMovie`)
    REFERENCES `laravel`.`movies` (`idMovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
AUTO_INCREMENT = 11
DEFAULT CHARACTER SET = utf8;

insert into trailers (idTrailer, trailerURL, trailerURL2, trailerLanguage, lastUpdate) values (1, 'convallis morbi odio odio elementum eu interdum eu tincidunt in leo maecenas pulvinar', 'leo odio porttitor id consequat in consequat ut nulla sed', 'Esp', '2021-02-13 13:25:23');
insert into trailers (idTrailer, trailerURL, trailerURL2, trailerLanguage,  lastUpdate) values (2, 'sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus vivamus vestibulum sagittis sapien cum sociis', 'at turpis a pede posuere nonummy integer non velit donec diam neque vestibulum', 'Esp', '2020-07-22 18:20:33');
insert into trailers (idTrailer, trailerURL, trailerURL2, trailerLanguage,  lastUpdate) values (3, 'sagittis sapien cum sociis natoque penatibus et magnis dis parturient montes nascetur ridiculus mus etiam', 'fusce consequat nulla nisl nunc nisl duis bibendum felis sed interdum venenatis turpis', 'Esp', '2021-03-25 20:37:06');
insert into trailers (idTrailer, trailerURL, trailerURL2, trailerLanguage,  lastUpdate) values (4, 'ut mauris eget massa tempor convallis nulla neque libero convallis eget eleifend luctus', 'a odio in hac habitasse platea dictumst maecenas ut massa quis augue luctus tincidunt nulla mollis molestie lorem quisque', 'Esp', '2021-02-25 15:42:51');
insert into trailers (idTrailer, trailerURL, trailerURL2, trailerLanguage,  lastUpdate) values (5, 'consequat ut nulla sed accumsan felis ut at dolor quis odio consequat varius integer ac', 'ornare imperdiet sapien urna pretium nisl ut volutpat sapien arcu', 'Esp', '2020-05-12 08:25:37');
insert into trailers (idTrailer, trailerURL, trailerURL2, trailerLanguage,  lastUpdate) values (6, 'congue risus semper porta volutpat quam pede lobortis ligula sit amet eleifend pede libero quis orci nullam molestie nibh', 'nunc purus phasellus in felis donec semper sapien a libero nam dui proin leo', 'Esp', '2020-07-09 00:30:34');
insert into trailers (idTrailer, trailerURL, trailerURL2, trailerLanguage,  lastUpdate) values (7, 'cum sociis natoque penatibus et magnis dis parturient montes nascetur', 'non mi integer ac neque duis bibendum morbi non quam nec dui luctus rutrum nulla tellus in sagittis dui vel', 'Esp', '2020-06-27 18:17:35');
insert into trailers (idTrailer, trailerURL, trailerURL2, trailerLanguage,  lastUpdate) values (8, 'turpis adipiscing lorem vitae mattis nibh ligula nec sem duis aliquam', 'massa id lobortis convallis tortor risus dapibus augue vel accumsan tellus nisi eu orci mauris lacinia sapien quis libero', 'Esp', '2021-04-24 05:26:14');
insert into trailers (idTrailer, trailerURL, trailerURL2, trailerLanguage,  lastUpdate) values (9, 'arcu libero rutrum ac lobortis vel dapibus at diam nam tristique tortor eu', 'morbi porttitor lorem id ligula suspendisse ornare consequat lectus in est risus auctor sed tristique in', 'Esp', '2020-11-04 17:31:19');
insert into trailers (idTrailer, trailerURL, trailerURL2, trailerLanguage,  lastUpdate) values (10, 'phasellus in felis donec semper sapien a libero nam dui proin leo odio porttitor id consequat in consequat ut nulla', 'in blandit ultrices enim lorem ipsum dolor sit amet consectetuer adipiscing elit proin', 'Esp', '2020-10-26 16:50:28');

-- -----------------------------------------------------
-- Table `laravel`.`creditCard`
-- -----------------------------------------------------
drop table if exists `laravel`.`creditCard`;

CREATE TABLE IF NOT EXISTS `laravel`.`creditCard` (
  `idcreditcard` INT NOT NULL,
  `creditCardNumber` BIGINT NULL,
  `credirCardCvv` INT(3) NULL,
  `creditCardExpiryYear` VARCHAR(7) NULL,
  `creditCardExpiryDate` VARCHAR(7) NULL,
  `creditCardOwner` VARCHAR(45) NULL,
  `creditCardType` VARCHAR(45) NULL,
  PRIMARY KEY (`idcreditcard`))
ENGINE = InnoDB;

insert into creditCard (idcreditcard, creditCardNumber, credirCardCvv, creditCardExpiryYear, creditCardOwner, creditCardType) values (1, '501860318792151104', 3, '02/2021', 'eget eros elementum pellentesque quisque', 'maestro');
insert into creditCard (idcreditcard, creditCardNumber, credirCardCvv, creditCardExpiryYear, creditCardOwner, creditCardType) values (2, '4913143402454272', 3, '21/2020', 'et magnis dis parturient', 'visa-electron');
insert into creditCard (idcreditcard, creditCardNumber, credirCardCvv, creditCardExpiryYear, creditCardOwner, creditCardType) values (3, '30093936334647', 3, '24/2020', 'libero quis orci', 'diners-club-carte-blanche');
insert into creditCard (idcreditcard, creditCardNumber, credirCardCvv, creditCardExpiryYear, creditCardOwner, creditCardType) values (4, '5466749630023149', 3, '05/2020', 'primis in', 'mastercard');
insert into creditCard (idcreditcard, creditCardNumber, credirCardCvv, creditCardExpiryYear, creditCardOwner, creditCardType) values (5, '4911863965671697', 3, '03/2020', 'erat id mauris vulputate', 'switch');

-- -----------------------------------------------------
-- Table `laravel`.`debitCard`
-- -----------------------------------------------------
drop table if exists `laravel`.`debitCard`;

CREATE TABLE IF NOT EXISTS `laravel`.`debitCard` (
  `idDebitCard` INT NOT NULL,
  `debitCardType` VARCHAR(45) NULL,
  `debitCardCvv` INT NULL,
  `debitCardExpiryDate` VARCHAR(7) NULL,
  `debitCardOwner` VARCHAR(45) NULL,
  PRIMARY KEY (`idDebitCard`))
ENGINE = InnoDB;

insert into debitCard (idDebitCard, debitCardType, debitCardCvv, debitCardExpiryDate, debitCardOwner) values (1, 'switch', 3, '12/2020', 'vestibulum ante ipsum primis in faucibus');
insert into debitCard (idDebitCard, debitCardType, debitCardCvv, debitCardExpiryDate, debitCardOwner) values (2, 'jcb', 3, '04/2020', 'nam congue risus semper porta volutpat');
insert into debitCard (idDebitCard, debitCardType, debitCardCvv, debitCardExpiryDate, debitCardOwner) values (3, 'mastercard', 3, '02/2021', 'sed tincidunt eu felis');
insert into debitCard (idDebitCard, debitCardType, debitCardCvv, debitCardExpiryDate, debitCardOwner) values (4, 'jcb', 3, '08/2020', 'vel lectus in quam fringilla rhoncus');
insert into debitCard (idDebitCard, debitCardType, debitCardCvv, debitCardExpiryDate, debitCardOwner) values (5, 'jcb', 3, '11/2020', 'vestibulum vestibulum ante');

-- -----------------------------------------------------
-- Table `laravel`.`bill`
-- -----------------------------------------------------
drop table if exists `laravel`.`bill`;

CREATE TABLE IF NOT EXISTS `laravel`.`bill` (
  `idBill` INT unsigned NOT NULL,
  `billDate` TIMESTAMP NOT NULL,
  `billValidate` TINYINT NOT NULL,
  `billToken` INT NOT NULL,
  `customers_idCustomer` BIGINT UNSIGNED NOT NULL,
  `payments_idPayment` BIGINT UNSIGNED NOT NULL,
  `discount` FLOAT NOT NULL,
  `value` FLOAT NOT NULL,
  `price` FLOAT NOT NULL,
  PRIMARY KEY (`idBill`),
  INDEX `fk_bill_customers1_idx` (`customers_idCustomer` ASC) VISIBLE,
  INDEX `fk_bill_payments1_idx` (`payments_idPayment` ASC) VISIBLE,
  CONSTRAINT `fk_bill_customers1`
    FOREIGN KEY (`customers_idCustomer`)
    REFERENCES `laravel`.`customers` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_bill_payments1`
    FOREIGN KEY (`payments_idPayment`)
    REFERENCES `laravel`.`payments` (`idPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

insert into bill (idBill, billDate, billValidate, billToken, customers_idCustomer, payments_idPayment, discount, value, price) values (1, '2021-03-20 19:08:33', 1, 8505, 1, 1, 40, 97, 86);
insert into bill (idBill, billDate, billValidate, billToken, customers_idCustomer, payments_idPayment, discount, value, price) values (2, '2021-01-17 01:37:01', 2, 16027, 2, 2, 2, 88, 1);
insert into bill (idBill, billDate, billValidate, billToken, customers_idCustomer, payments_idPayment, discount, value, price) values (3, '2020-05-07 10:08:44', 1, 14984, 3, 3, 42, 35, 83);
insert into bill (idBill, billDate, billValidate, billToken, customers_idCustomer, payments_idPayment, discount, value, price) values (4, '2021-01-08 13:09:05', 1, 11264, 4, 4, 83, 45, 88);
insert into bill (idBill, billDate, billValidate, billToken, customers_idCustomer, payments_idPayment, discount, value, price) values (5, '2020-10-11 15:29:42', 1, 2541, 5, 5, 85, 89, 80);
insert into bill (idBill, billDate, billValidate, billToken, customers_idCustomer, payments_idPayment, discount, value, price) values (6, '2020-11-28 10:08:08', 1, 13446, 6, 6, 32, 50, 19);
insert into bill (idBill, billDate, billValidate, billToken, customers_idCustomer, payments_idPayment, discount, value, price) values (7, '2020-10-06 12:19:54', 1, 21074, 7, 7, 86, 87, 91);
insert into bill (idBill, billDate, billValidate, billToken, customers_idCustomer, payments_idPayment, discount, value, price) values (8, '2020-08-14 13:16:28', 1, 9384, 8, 8, 66, 39, 4);
insert into bill (idBill, billDate, billValidate, billToken, customers_idCustomer, payments_idPayment, discount, value, price) values (9, '2020-09-26 20:26:15', 2, 2432, 9, 9, 38, 8, 24);
insert into bill (idBill, billDate, billValidate, billToken, customers_idCustomer, payments_idPayment, discount, value, price) values (10, '2020-07-15 21:52:24', 1, 17629, 10, 10, 47, 62, 13);

-- -----------------------------------------------------
-- Table `laravel`.`purchaseHistories`
-- -----------------------------------------------------
drop table if exists `laravel`.`purchaseHistories`;

CREATE TABLE IF NOT EXISTS `laravel`.`purchaseHistories` (
  `idpurchaseHistories` INT NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL,
  `tickets_idTicket` BIGINT UNSIGNED NOT NULL,
  `bill_idBill` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idpurchaseHistories`),
  INDEX `fk_purchaseHistories_tickets1_idx` (`tickets_idTicket` ASC) VISIBLE,
  INDEX `fk_purchaseHistories_bill1_idx` (`bill_idBill` ASC) VISIBLE,
  CONSTRAINT `fk_purchaseHistories_tickets1`
    FOREIGN KEY (`tickets_idTicket`)
    REFERENCES `laravel`.`tickets` (`idTicket`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_purchaseHistories_bill1`
    FOREIGN KEY (`bill_idBill`)
    REFERENCES `laravel`.`bill` (`idBill`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

insert into purchaseHistories (idpurchaseHistories, lastUpdate, tickets_idTicket, bill_idBill) values (1, '2021-01-02 17:45:31', 1, 1);
insert into purchaseHistories (idpurchaseHistories, lastUpdate, tickets_idTicket, bill_idBill) values (2, '2021-01-17 20:35:22', 2, 2);
insert into purchaseHistories (idpurchaseHistories, lastUpdate, tickets_idTicket, bill_idBill) values (3, '2021-02-17 23:39:44', 3, 3);
insert into purchaseHistories (idpurchaseHistories, lastUpdate, tickets_idTicket, bill_idBill) values (4, '2020-08-28 15:54:48', 4, 4);
insert into purchaseHistories (idpurchaseHistories, lastUpdate, tickets_idTicket, bill_idBill) values (5, '2020-05-24 00:56:07', 5, 5);
insert into purchaseHistories (idpurchaseHistories, lastUpdate, tickets_idTicket, bill_idBill) values (6, '2021-01-01 16:46:57', 6, 6);
insert into purchaseHistories (idpurchaseHistories, lastUpdate, tickets_idTicket, bill_idBill) values (7, '2020-08-28 02:11:54', 7, 7);
insert into purchaseHistories (idpurchaseHistories, lastUpdate, tickets_idTicket, bill_idBill) values (8, '2021-04-20 15:38:21', 8, 8);
insert into purchaseHistories (idpurchaseHistories, lastUpdate, tickets_idTicket, bill_idBill) values (9, '2020-10-30 11:15:15', 9, 9);
insert into purchaseHistories (idpurchaseHistories, lastUpdate, tickets_idTicket, bill_idBill) values (10, '2021-02-25 08:50:41', 10, 10);

-- -----------------------------------------------------
-- Table `laravel`.`paymentmethods`
-- -----------------------------------------------------
drop table if exists `laravel`.`paymentmethods`;


CREATE TABLE IF NOT EXISTS `laravel`.`paymentmethods` (
  `idpaymentmethods` INT NOT NULL,
  `purchaseHistories_idpurchaseHistories` INT NOT NULL,
  PRIMARY KEY (`idpaymentmethods`),
  INDEX `fk_paymentmethods_purchaseHistories1_idx` (`purchaseHistories_idpurchaseHistories` ASC) VISIBLE,
  CONSTRAINT `fk_paymentmethods_purchaseHistories1`
    FOREIGN KEY (`purchaseHistories_idpurchaseHistories`)
    REFERENCES `laravel`.`purchaseHistories` (`idpurchaseHistories`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

insert into paymentmethods (idpaymentmethods, purchaseHistories_idpurchaseHistories) values (1, 1);
insert into paymentmethods (idpaymentmethods, purchaseHistories_idpurchaseHistories) values (2, 2);
insert into paymentmethods (idpaymentmethods, purchaseHistories_idpurchaseHistories) values (3, 3);
insert into paymentmethods (idpaymentmethods, purchaseHistories_idpurchaseHistories) values (4, 4);
insert into paymentmethods (idpaymentmethods, purchaseHistories_idpurchaseHistories) values (5, 5);
insert into paymentmethods (idpaymentmethods, purchaseHistories_idpurchaseHistories) values (6, 6);
insert into paymentmethods (idpaymentmethods, purchaseHistories_idpurchaseHistories) values (7, 7);
insert into paymentmethods (idpaymentmethods, purchaseHistories_idpurchaseHistories) values (8, 8);
insert into paymentmethods (idpaymentmethods, purchaseHistories_idpurchaseHistories) values (9, 9);
insert into paymentmethods (idpaymentmethods, purchaseHistories_idpurchaseHistories) values (10, 10);

-- -----------------------------------------------------
-- Table `laravel`.`PosterLink`
-- -----------------------------------------------------
drop table if exists `laravel`.`PosterLink`;

CREATE TABLE IF NOT EXISTS `laravel`.`PosterLink` (
  `idPoster` INT NOT NULL AUTO_INCREMENT,
  `idPosterLink` INT NOT NULL,
  `posters_idPoster` INT UNSIGNED NOT NULL,
  `users_idUser` BIGINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idPoster`, `idPosterLink`),
  INDEX `fk_PosterLink_posters1_idx` (`posters_idPoster` ASC) VISIBLE,
  INDEX `fk_PosterLink_users1_idx` (`users_idUser` ASC) VISIBLE,
  CONSTRAINT `fk_PosterLink_posters1`
    FOREIGN KEY (`posters_idPoster`)
    REFERENCES `laravel`.`posters` (`idPoster`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PosterLink_users1`
    FOREIGN KEY (`users_idUser`)
    REFERENCES `laravel`.`users` (`idUser`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

insert into PosterLink (idPoster, idPosterLink, posters_idPoster, users_idUser) values (1, 1, 1, 1);
insert into PosterLink (idPoster, idPosterLink, posters_idPoster, users_idUser) values (2, 2, 2, 2);
insert into PosterLink (idPoster, idPosterLink, posters_idPoster, users_idUser) values (3, 3, 3, 3);
insert into PosterLink (idPoster, idPosterLink, posters_idPoster, users_idUser) values (4, 4, 4, 4);
insert into PosterLink (idPoster, idPosterLink, posters_idPoster, users_idUser) values (5, 5, 5, 5);
insert into PosterLink (idPoster, idPosterLink, posters_idPoster, users_idUser) values (6, 6, 6, 6);
insert into PosterLink (idPoster, idPosterLink, posters_idPoster, users_idUser) values (7, 7, 7, 7);
insert into PosterLink (idPoster, idPosterLink, posters_idPoster, users_idUser) values (8, 8, 8, 8);
insert into PosterLink (idPoster, idPosterLink, posters_idPoster, users_idUser) values (9, 9, 9, 9);
insert into PosterLink (idPoster, idPosterLink, posters_idPoster, users_idUser) values (10, 10, 10, 10);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
