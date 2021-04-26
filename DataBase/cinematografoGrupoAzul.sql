ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'root';
ALTER USER 'root'@'%' IDENTIFIED WITH mysql_native_password BY 'root';
ALTER USER 'default'@'%' IDENTIFIED WITH mysql_native_password BY 'secret';
create database if not exists laravel;

-- drop table laravel.Actors, laravel.Address, laravel.categories, laravel.Cities, laravel.Countries, laravel.Customers, `laravel`.`events`, laravel.events_categories, laravel.failedJobs 

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
-- Table `laravel`.`actors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`actors` (
  `idActor` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(30) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actorPhoto` BLOB NOT NULL,
  PRIMARY KEY (`idActor`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `laravel`.`cities`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`cities` (
  `idCity` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `city` VARCHAR(50) NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `countries_idCountry` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idCity`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `laravel`.`address`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`address` (
  `idAddress` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `address` VARCHAR(50) NOT NULL,
  `address2` VARCHAR(50) NULL DEFAULT NULL,
  `district` VARCHAR(20) NOT NULL,
  `postalCode` VARCHAR(10) NULL DEFAULT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `country` VARCHAR(60) NOT NULL,
  `cities_idCity` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idAddress`),
  INDEX `fk_address_cities1_idx` (`cities_idCity` ASC) VISIBLE,
  CONSTRAINT `fk_address_cities1`
    FOREIGN KEY (`cities_idCity`)
    REFERENCES `laravel`.`cities` (`idCity`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `laravel`.`users`
-- -----------------------------------------------------
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


-- -----------------------------------------------------
-- Table `laravel`.`customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`customers` (
  `idCustomer` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `active` BLOB NOT NULL,
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


-- -----------------------------------------------------
-- Table `laravel`.`movieTexts`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`movieTexts` (
  `idMovieTexts` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(255) NOT NULL,
  `description` TEXT NULL DEFAULT NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idMovieTexts`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `laravel`.`Halls`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`Halls` (
  `idHall` TINYINT UNSIGNED NOT NULL,
  `hallNumber` TINYINT NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idHall`),
  UNIQUE INDEX `idHall_UNIQUE` (`idHall` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `laravel`.`staffs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`staffs` (
  `idStaff` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `firstName` VARCHAR(45) NOT NULL,
  `lastName` VARCHAR(45) NOT NULL,
  `picture` BLOB NULL DEFAULT NULL,
  `email` VARCHAR(45) NOT NULL,
  `username` VARCHAR(30) NOT NULL,
  `password` VARCHAR(200) NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `address_idAddress` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idStaff`),
  INDEX `fk_staffs_address1_idx` (`address_idAddress` ASC) VISIBLE,
  CONSTRAINT `fk_staffs_address1`
    FOREIGN KEY (`address_idAddress`)
    REFERENCES `laravel`.`address` (`idAddress`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `laravel`.`types`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`types` (
  `idtype` INT NOT NULL,
  `typeName` VARCHAR(45) NULL,
  `lastUpdate` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtype`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`stores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`stores` (
  `idStore` TINYINT NOT NULL AUTO_INCREMENT,
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


-- -----------------------------------------------------
-- Table `laravel`.`payments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`payments` (
  `idPayment` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `amount` DECIMAL(5,2) NOT NULL,
  `paymentDate` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `staffs_idStaff` TINYINT UNSIGNED NOT NULL,
  `types_idtype` INT NOT NULL,
  `stores_idStore` TINYINT NOT NULL,
  PRIMARY KEY (`idPayment`),
  INDEX `fk_payments_staffs1_idx` (`staffs_idStaff` ASC) VISIBLE,
  INDEX `fk_payments_types1_idx` (`types_idtype` ASC) VISIBLE,
  INDEX `fk_payments_stores1_idx` (`stores_idStore` ASC) VISIBLE,
  CONSTRAINT `fk_payments_staffs1`
    FOREIGN KEY (`staffs_idStaff`)
    REFERENCES `laravel`.`staffs` (`idStaff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payments_types1`
    FOREIGN KEY (`types_idtype`)
    REFERENCES `laravel`.`types` (`idtype`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_payments_stores1`
    FOREIGN KEY (`stores_idStore`)
    REFERENCES `laravel`.`stores` (`idStore`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `laravel`.`marathones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`marathones` (
  `idMarathones` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `titleMovie` VARCHAR(300) NOT NULL,
  `marathonRuntime` INT NOT NULL,
  `synopsis` LONGTEXT NOT NULL,
  `marathonRating` DOUBLE NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payments_idPayment` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idMarathones`),
  INDEX `fk_marathones_payments1_idx` (`payments_idPayment` ASC) VISIBLE,
  CONSTRAINT `fk_marathones_payments1`
    FOREIGN KEY (`payments_idPayment`)
    REFERENCES `laravel`.`payments` (`idPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `laravel`.`movies`
-- -----------------------------------------------------
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
  PRIMARY KEY (`idMovie`),
  INDEX `idLanguage_idx` (`original_language_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `laravel`.`posters`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`posters` (
  `idPoster` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `posterLink1` VARCHAR(500) NOT NULL,
  `posterLink2` VARCHAR(500) NULL,
  `posterLink3` VARCHAR(500) NULL,
  `posterLink4` VARCHAR(500) NULL,
  `posterLink5` VARCHAR(500) NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `posterName` VARCHAR(45) NOT NULL,
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


-- -----------------------------------------------------
-- Table `laravel`.`Seats`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`Seats` (
  `idSeats` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `seatPosition` VARCHAR(4) NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Halls_idHall` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idSeats`),
  INDEX `fk_Seats_Halls1_idx` (`Halls_idHall` ASC) VISIBLE,
  CONSTRAINT `fk_Seats_Halls1`
    FOREIGN KEY (`Halls_idHall`)
    REFERENCES `laravel`.`Halls` (`idHall`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `laravel`.`events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`events` (
  `idEvent` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `payments_idPayment` SMALLINT NOT NULL,
  `synopsis` LONGTEXT NOT NULL,
  `eventTitle` VARCHAR(300) NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payments_idPayment1` SMALLINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idEvent`),
  INDEX `fk_events_payments1_idx` (`payments_idPayment1` ASC) VISIBLE,
  CONSTRAINT `fk_events_payments1`
    FOREIGN KEY (`payments_idPayment1`)
    REFERENCES `laravel`.`payments` (`idPayment`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `laravel`.`tickets`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`tickets` (
  `idTicket` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `ticketPrize` DECIMAL(10,0) NULL DEFAULT NULL,
  `movies_idMovie` INT UNSIGNED NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `payments_idPayment` SMALLINT UNSIGNED NOT NULL,
  `customers_idCustomer` BIGINT UNSIGNED NOT NULL,
  `price` VARCHAR(45) NOT NULL,
  `discount` VARCHAR(45) NOT NULL,
  `ticketValue` VARCHAR(45) NOT NULL,
  `ticketName` VARCHAR(45) NOT NULL,
  `description` TEXT NOT NULL,
  `termCondition` TEXT NOT NULL,
  `date` TIMESTAMP NOT NULL,
  `events_idEvent` INT UNSIGNED NOT NULL,
  `marathones_idMarathones` INT UNSIGNED NOT NULL,
  `Halls_idHall` TINYINT UNSIGNED NOT NULL,
  PRIMARY KEY (`idTicket`),
  INDEX `fk_Tickets_movies_idx` (`movies_idMovie` ASC) VISIBLE,
  INDEX `fk_tickets_payments1_idx` (`payments_idPayment` ASC) VISIBLE,
  INDEX `fk_tickets_customers1_idx` (`customers_idCustomer` ASC) VISIBLE,
  INDEX `fk_tickets_events1_idx` (`events_idEvent` ASC) VISIBLE,
  INDEX `fk_tickets_marathones1_idx` (`marathones_idMarathones` ASC) VISIBLE,
  INDEX `fk_tickets_Halls1_idx` (`Halls_idHall` ASC) VISIBLE,
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
    FOREIGN KEY (`Halls_idHall`)
    REFERENCES `laravel`.`Halls` (`idHall`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `laravel`.`categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`categories` (
  `idCategory` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `categoryName` VARCHAR(25) NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idCategory`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


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
-- Table `laravel`.`languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`languages` (
  `idLanguage` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `languageName` CHAR(200) NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idLanguage`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


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
-- Table `laravel`.`movies_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`movies_categories` (
  `idMovies_categories` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `categories_idCategory` INT UNSIGNED NOT NULL,
  `movies_idMovie` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idMovies_categories`),
  INDEX `fk_movies_categories_categories_idx` (`categories_idCategory` ASC) VISIBLE,
  INDEX `fk_movies_categories_movies_idx` (`movies_idMovie` ASC) VISIBLE,
  CONSTRAINT `fk_movies_categories_categories`
    FOREIGN KEY (`categories_idCategory`)
    REFERENCES `laravel`.`categories` (`idCategory`),
  CONSTRAINT `fk_movies_categories_movies`
    FOREIGN KEY (`movies_idMovie`)
    REFERENCES `laravel`.`movies` (`idMovie`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


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
  `trailerURL2` VARCHAR(500) NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idTrailer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `laravel`.`events_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`events_categories` (
  `idEvents_categories` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `categories_idCategory` INT UNSIGNED NOT NULL,
  `events_idEvent` INT UNSIGNED NOT NULL,
  `categories_idCategory1` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idEvents_categories`),
  INDEX `fk_events_categories_events1_idx` (`events_idEvent` ASC) VISIBLE,
  INDEX `fk_events_categories_categories1_idx` (`categories_idCategory1` ASC) VISIBLE,
  CONSTRAINT `fk_events_categories_events1`
    FOREIGN KEY (`events_idEvent`)
    REFERENCES `laravel`.`events` (`idEvent`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_events_categories_categories1`
    FOREIGN KEY (`categories_idCategory1`)
    REFERENCES `laravel`.`categories` (`idCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `laravel`.`marathones_categories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`marathones_categories` (
  `idMarathon_categories` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `categories_idCategory` INT UNSIGNED NOT NULL,
  `marathones_idMarathones` INT NOT NULL,
  `marathones_idMarathones1` INT UNSIGNED NOT NULL,
  `categories_idCategory1` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idMarathon_categories`),
  INDEX `fk_marathones_categories_marathones1_idx` (`marathones_idMarathones1` ASC) VISIBLE,
  INDEX `fk_marathones_categories_categories1_idx` (`categories_idCategory1` ASC) VISIBLE,
  CONSTRAINT `fk_marathones_categories_marathones1`
    FOREIGN KEY (`marathones_idMarathones1`)
    REFERENCES `laravel`.`marathones` (`idMarathones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_marathones_categories_categories1`
    FOREIGN KEY (`categories_idCategory1`)
    REFERENCES `laravel`.`categories` (`idCategory`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `laravel`.`stores_staffs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`stores_staffs` (
  `idStore` TINYINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `idStaff` TINYINT UNSIGNED NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `staffs_idStaff` TINYINT UNSIGNED NOT NULL,
  `stores_idStore` TINYINT NOT NULL,
  PRIMARY KEY (`idStore`, `idStaff`),
  INDEX `fk_stores_staffs_staffs_idx` (`staffs_idStaff` ASC) VISIBLE,
  INDEX `fk_stores_staffs_stores_idx` (`stores_idStore` ASC) VISIBLE,
  CONSTRAINT `fk_stores_staffs_staffs`
    FOREIGN KEY (`staffs_idStaff`)
    REFERENCES `laravel`.`staffs` (`idStaff`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_stores_staffs_stores`
    FOREIGN KEY (`stores_idStore`)
    REFERENCES `laravel`.`stores` (`idStore`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`moviesActors`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`moviesActors` (
  `idMovieActor` SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  `lastUpdate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `actors_idActor` SMALLINT UNSIGNED NOT NULL,
  `movies_idMovie` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idMovieActor`),
  INDEX `fk_moviesActors_actors1_idx` (`actors_idActor` ASC) VISIBLE,
  INDEX `fk_moviesActors_movies1_idx` (`movies_idMovie` ASC) VISIBLE,
  CONSTRAINT `fk_moviesActors_actors1`
    FOREIGN KEY (`actors_idActor`)
    REFERENCES `laravel`.`actors` (`idActor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_moviesActors_movies1`
    FOREIGN KEY (`movies_idMovie`)
    REFERENCES `laravel`.`movies` (`idMovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`movies_trailers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`movies_trailers` (
  `idMovies_trailers` INT NOT NULL,
  `movies_idMovie` INT UNSIGNED NOT NULL,
  `trailers_idTrailer` INT UNSIGNED NOT NULL,
  `lastUpdate` TIMESTAMP NULL,
  PRIMARY KEY (`idMovies_trailers`),
  INDEX `fk_movies_trailers_movies1_idx` (`movies_idMovie` ASC) VISIBLE,
  INDEX `fk_movies_trailers_trailers1_idx` (`trailers_idTrailer` ASC) VISIBLE,
  CONSTRAINT `fk_movies_trailers_movies1`
    FOREIGN KEY (`movies_idMovie`)
    REFERENCES `laravel`.`movies` (`idMovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movies_trailers_trailers1`
    FOREIGN KEY (`trailers_idTrailer`)
    REFERENCES `laravel`.`trailers` (`idTrailer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`movies_languages`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`movies_languages` (
  `idmovies_languages` INT NOT NULL,
  `movies_idMovie` INT UNSIGNED NOT NULL,
  `languages_idLanguage` TINYINT UNSIGNED NOT NULL,
  `lastUpdate` TIMESTAMP NULL,
  PRIMARY KEY (`idmovies_languages`),
  INDEX `fk_movies_languages_movies1_idx` (`movies_idMovie` ASC) VISIBLE,
  INDEX `fk_movies_languages_languages1_idx` (`languages_idLanguage` ASC) VISIBLE,
  CONSTRAINT `fk_movies_languages_movies1`
    FOREIGN KEY (`movies_idMovie`)
    REFERENCES `laravel`.`movies` (`idMovie`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_movies_languages_languages1`
    FOREIGN KEY (`languages_idLanguage`)
    REFERENCES `laravel`.`languages` (`idLanguage`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`languages_trailers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`languages_trailers` (
  `idlanguages_trailers` INT NOT NULL,
  `lastUpdate` TIMESTAMP NULL,
  `languages_idLanguage` TINYINT UNSIGNED NOT NULL,
  `trailers_idTrailer` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`idlanguages_trailers`),
  INDEX `fk_languages_trailers_languages1_idx` (`languages_idLanguage` ASC) VISIBLE,
  INDEX `fk_languages_trailers_trailers1_idx` (`trailers_idTrailer` ASC) VISIBLE,
  CONSTRAINT `fk_languages_trailers_languages1`
    FOREIGN KEY (`languages_idLanguage`)
    REFERENCES `laravel`.`languages` (`idLanguage`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_languages_trailers_trailers1`
    FOREIGN KEY (`trailers_idTrailer`)
    REFERENCES `laravel`.`trailers` (`idTrailer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`creditCard`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`creditCard` (
  `idcreditcard` INT NOT NULL,
  `creditCardNumber` INT NULL,
  `credirCardCvv` INT NULL,
  `creditCardExpiryYear` INT NULL,
  `creditCardExpiryDate` INT NULL,
  `creditCardOwner` VARCHAR(45) NULL,
  `cresitCardType` VARCHAR(45) NULL,
  PRIMARY KEY (`idcreditcard`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`debitCard`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`debitCard` (
  `idDebitCard` INT NOT NULL,
  `debitCardType` VARCHAR(45) NULL,
  `debitCardCvv` INT NULL,
  `debitCardExpiryDate` INT NULL,
  `debitCardOwner` VARCHAR(45) NULL,
  PRIMARY KEY (`idDebitCard`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`bill`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`bill` (
  `idBill` INT NOT NULL,
  `billDate` TIMESTAMP NOT NULL,
  `billValidate` TINYINT NOT NULL,
  `billToken` INT NOT NULL,
  `customers_idCustomer` BIGINT UNSIGNED NOT NULL,
  `payments_idPayment` SMALLINT UNSIGNED NOT NULL,
  `discount` FLOAT NOT NULL,
  `value` FLOAT NOT NULL,
  `price` FLOAT NOT NULL,
  `billcol` VARCHAR(45) NULL,
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


-- -----------------------------------------------------
-- Table `laravel`.`purchaseHistories`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`purchaseHistories` (
  `idpurchaseHistories` INT NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL,
  `tickets_idTicket` BIGINT UNSIGNED NOT NULL,
  `bill_idBill` INT NOT NULL,
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


-- -----------------------------------------------------
-- Table `laravel`.`paypalDirect`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`paypalDirect` (
  `idpaypal` INT NOT NULL,
  `paypalAccount` VARCHAR(100) NULL,
  `lasttUpdate` TIMESTAMP NOT NULL,
  `cratedDate` TIMESTAMP NOT NULL,
  `updatedDate` TIMESTAMP NOT NULL,
  `papypalTransactionId` VARCHAR(255) NULL,
  `paypalResourceId` VARCHAR(500) NULL,
  `amount` FLOAT NOT NULL,
  `quantity` INT NOT NULL,
  `currency` VARCHAR(45) NULL,
  `address1` VARCHAR(255) NULL,
  `address2` VARCHAR(255) NULL,
  `city` VARCHAR(100) NULL,
  `state` VARCHAR(100) NULL,
  `postalCode` VARCHAR(100) NULL,
  `countryCode` VARCHAR(10) NULL,
  `phone` VARCHAR(20) NULL,
  `status` TINYINT NOT NULL,
  PRIMARY KEY (`idpaypal`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`paypalCheckout`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`paypalCheckout` (
  `idpaypalCheckout` INT NOT NULL,
  `paypalCResourceId` VARCHAR(45) NULL,
  `createdDate` TIMESTAMP NOT NULL,
  `updatedDate` TIMESTAMP NOT NULL,
  `amount` FLOAT NOT NULL,
  `quantity` INT NOT NULL,
  `currency` VARCHAR(45) NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL,
  PRIMARY KEY (`idpaypalCheckout`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`paymentmethods`
-- -----------------------------------------------------
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


-- -----------------------------------------------------
-- Table `laravel`.`creditCardCheckout`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`creditCardCheckout` (
  `idCreditCardCheckout` INT NOT NULL,
  `currency` VARCHAR(45) NOT NULL,
  `amount` FLOAT NOT NULL,
  `updateDate` TIMESTAMP NOT NULL,
  `lastUpdate` TIMESTAMP NOT NULL,
  `quantity` INT NOT NULL,
  `creditCardNumber` INT NULL,
  `creditCardCvv` INT NULL,
  `creditCardExpireYear` INT NULL,
  `creditCardDate` INT NULL,
  `creditCarOwner` VARCHAR(45) NULL,
  `creditCardType` VARCHAR(45) NULL,
  PRIMARY KEY (`idCreditCardCheckout`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `laravel`.`debitCardCheckout`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `laravel`.`debitCardCheckout` (
  `iddebitCardCheckout` INT NOT NULL,
  `debitCardType` VARCHAR(45) NULL,
  `debitCardCvv` INT NULL,
  `debitCardExpiryDate` INT NULL,
  `debitCardOwner` VARCHAR(45) NULL,
  `debitCardCheckoutcol` VARCHAR(45) NULL,
  `lastUpdate` TIMESTAMP NOT NULL,
  PRIMARY KEY (`iddebitCardCheckout`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
