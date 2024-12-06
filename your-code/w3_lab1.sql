-- + =====================================================
-- | Lab | Intro to MySql
-- + =====================================================

-- + -----------------------------------------------------
-- | Challenge 1 - Design the Database
-- + -----------------------------------------------------

-- We need to create at least 4 tables:
-- 	1. Cars: 
	-- car_id (primary key) : int, 
    -- model: varchar, 
    -- year : int, 
    -- price : float
-- 	2. Customers: 
	-- customer_id (primary key) : int, 
    -- name: charvar, 
    -- last_name : charvar, 
    -- address : charvar, 
    -- city : charvar, 
    -- gender : charvar, 
    -- age : int, 
    -- birthdate: date
-- 	3. Salesperson: 
	-- salesperson_id (primary_key), 
    -- name : charvar, 
    -- last_name : charvar, 
    -- age : int, 
    -- gender : charvar, 
    -- adress : charvar, 
    -- city : charvar, 
    -- birthdate: date
-- 	4. Invoice: 
	-- invoice_num (primary key): int, 
    -- customer_id (foreign key): int
    -- car_id (foreign key): int, 
    -- salesperson_id (foreign key): int, 
    -- car_price [an invoice can have many cars]: float
    
-- + -----------------------------------------------------
-- | Challenge 2 - Create the Database and Tables
-- | Already done with create script!!
-- + -----------------------------------------------------

DROP DATABASE IF EXISTS cars;
CREATE DATABASE cars; 
USE cars;

-- -----------------------------------------------------
-- Table `cars`.`cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`cars` (
  `car_id` INT NOT NULL,
  `manufacturer` VARCHAR(20) NOT NULL,
  `model` VARCHAR(20) NOT NULL,
  `year_` INT NOT NULL,
  `color` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`car_id`));

-- -----------------------------------------------------
-- Table `cars`.`costumer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`costumer` (
  `costumer_id` INT NOT NULL,
  `first_name` VARCHAR(20) NOT NULL,
  `last_name` VARCHAR(20),
  `phone_no` VARCHAR(20) NULL DEFAULT NULL,
  `email` VARCHAR(20) NULL DEFAULT NULL,
  `address` VARCHAR(40) NULL DEFAULT NULL,
  `city` VARCHAR(20) NULL DEFAULT NULL,
  `state` VARCHAR(20) NULL DEFAULT NULL,
  `country` VARCHAR(20) NULL DEFAULT NULL,
  `zip_code` VARCHAR(20) NULL DEFAULT NULL,
  `client` INT NULL DEFAULT NULL,
  PRIMARY KEY (`costumer_id`));

  -- -----------------------------------------------------
-- Table `cars`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`salesperson` (
  `salesperson_id` INT NOT NULL,
  `first_name` VARCHAR(40) NOT NULL,
  `store_name` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`salesperson_id`));

-- -----------------------------------------------------
-- Table `cars`.`invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cars`.`invoices` (
  `invoice_id` INT NOT NULL,
  `date_` DATE NULL DEFAULT NULL,
  `car` VARCHAR(20) NOT NULL,
  `costumer` VARCHAR(20) NULL DEFAULT NULL,
  `salesperson` VARCHAR(20) NULL DEFAULT NULL,
  `salesperson_salesperson_id` INT NOT NULL,
  `cars_car_id` INT NOT NULL,
  `costumer_costumer_id` INT NOT NULL,
  PRIMARY KEY (`invoice_id`),
  INDEX `fk_invoices_salesperson_idx` (`salesperson_salesperson_id` ASC) VISIBLE,
  INDEX `fk_invoices_cars1_idx` (`cars_car_id` ASC) VISIBLE,
  INDEX `fk_invoices_costumer1_idx` (`costumer_costumer_id` ASC) VISIBLE,
  CONSTRAINT `fk_invoices_salesperson`
    FOREIGN KEY (`salesperson_id`)
    REFERENCES `cars`.`salesperson` (`salesperson_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_cars1`
    FOREIGN KEY (`cars_car_id`)
    REFERENCES `cars`.`cars` (`car_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoices_costumer1`
    FOREIGN KEY (`costumer_costumer_id`)
    REFERENCES `cars`.`costumer` (`costumer_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- + -----------------------------------------------------
-- | Challenge 3 - Seeding the Database
-- | Already done with create script!!
-- + -----------------------------------------------------

insert into cars(car_id, manufacturer, model, year_, color)
values ('0', 'Volkswagen','Tiguan', '2019','Blue'),
('1', 'Peugeot','Rifter', '2019', 'Red'),
('2', 'Ford','Fusion', '2018', 'White'),
('3', 'Toyota','RAV4', '2018', 'Silver'),
('4', 'Volvo', 'V60', '2019', 'Gray'),
('5', 'Volvo','V60 Cross Country', '2019', 'Gray');


insert into costumer(costumer_id, first_name, phone_no, email, address, city, state, country, zip_code)
values ('10001', 'Pablo Picasso', '+34 636 17 63 82', '-', 'Paseo de la Chope', 'Madrid', 'Madrid', 'Spain', '28045'),
('20001', 'Abraham Lincoln', '+1 305 907 7086', '-', '120 SW 8th St', 'Miami', 'Florida', 'United States', '33130'),
('30001', 'Napoleon Bonaparte', '+33 1 79 75 40 00', '-', '40 Rue du Colisée', 'Paris', 'Île-de-France', 'France', '75008');

insert into salesperson (salesperson_id, first_name, store_name)
values ('00001', 'Petey Cruiser', '0'),
('00002', 'Anna Sthesia', '1'),
('00003', 'Paul Molive', '2'),
('00004', 'Gail Forcewind', '3'),
('00005', 'Paige Turner', '4'),
('00006', 'Bob Frapples', '5'),
('00007', 'Walter Melon', '6'),
('00008', 'Shonda Leer', 'São Paulo');

insert into invoices (invoice_id, date_, car, costumer, salesperson)
values ('852399038', '2018-08-22',	'0','1','3'),
('731166526', '2018-12-31', '3', '0', '5'),
('271135104', '2019-01-22', '2','2','7');
