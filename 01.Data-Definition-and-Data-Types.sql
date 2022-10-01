-- create database called minions
CREATE DATABASE minions;

-- use the minions databe
USE `minions`;

-- create table minions with id, name, and age columns
CREATE TABLE minions (
    `id` INT AUTO_INCREMENT,
    `name` VARCHAR(30),
    `age` INT,
    PRIMARY KEY (`id`)
);

-- create table towns with town_id and name columns
CREATE TABLE towns (
    `town_id` INT AUTO_INCREMENT,
    `name` VARCHAR(30),
    PRIMARY KEY (`town_id`)
);

-- rename town_id to id
ALTER TABLE `towns` 
CHANGE COLUMN `town_id` `id` INT AUTO_INCREMENT ;

-- add new column to table minions that will be foreing key references to the towns.id column
ALTER TABLE `minions` 
ADD `town_id` INT,
ADD CONSTRAINT `town_id`
	FOREIGN KEY (`town_id`)
	REFERENCES `towns` (`id`);

-- populate towns table with data
INSERT INTO `towns` (`id`, `name`)
VALUES
    (1, "Sofia"),
    (2, "Plovdiv"),
    (3, "Varna");
    
-- populate minions table with info
INSERT INTO `minions` (`id`, `name`, `age`, `town_id`)
VALUES 
    (1, "Kevin", 22, 1),
    (2, "Bob", 15, 3),
    (3, "Steward", NULL, 2);

-- delete all data from table minions
TRUNCATE TABLE `minions`;

-- delete all tables in the database minions
DROP TABLE `minions`, `towns`;

-- crate table people with id, name, picture, height, weight, gender, birthdate, biography
CREATE TABLE `people` (
    `id` INT AUTO_INCREMENT PRIMARY KEY NOT NULL,
    `name` VARCHAR(200) NOT NULL,
    `picture` BLOB,
    `height` FLOAT(2),
    `weight` FLOAT(2),
    `gender` ENUM('m', 'f') NOT NULL,
    `birthdate` DATE NOT NULL,
    `biography` TEXT
);

-- insert 5 rows of data into the table people
INSERT INTO `people` (`name`, `picture`, `height`, `weight`, `gender`, `birthdate`, `biography`)
VALUES
    ("Pesho", NULL, 1.15, 68.59, "m", "1994-08-25", NULL),
    ("Maria", NULL, 1.65, 40, "f", "1994-08-25", NULL),
    ("George", NULL, NULL, 68.59, "m", "1994-08-25", NULL),
    ("Peter", NULL, 1.95, NULL, "m", "1994-08-25", NULL),
    ("Martin", NULL, 1.855, NULL, "m", "1994-08-25", NULL);

-- create table users with id, username, password, profile picture, last login time, is deleted
CREATE TABLE `users` (
    `id` BIGINT UNIQUE AUTO_INCREMENT PRIMARY KEY,
    `username` VARCHAR(30) NOT NULL,
    `password` VARCHAR(26) NOT NULL,
    `profile_picture` BLOB,
    `last_login_time` DATETIME,
    `is_deleted` BOOLEAN
);

-- add 5 rows of data into users table
INSERT INTO `users` (`username`, `password`, `profile_picture`, `last_login_time`, `is_deleted`)
VALUES
    ("a", "password", NULL, NULL, TRUE),
    ("b", "password", NULL, NULL, TRUE),
    ("c", "password", NULL, NULL, TRUE),
    ("d", "password", NULL, NULL, TRUE),
    ("e", "password", NULL, NULL, TRUE);

-- remove current primary key from table users
ALTER TABLE `users`
DROP PRIMARY KEY,
-- generate a new primary key combination of id and username
ADD CONSTRAINT `pk_users` PRIMARY KEY(`id`, `username`);

-- make the last login time current time
ALTER TABLE `users`
MODIFY `last_login_time` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP;

-- modify teable users
ALTER TABLE `users`
-- remove username from  primary key
DROP PRIMARY KEY,
ADD CONSTRAINT `pk_users` PRIMARY KEY(`id`),
-- add unique constraint to the username
MODIFY `username` VARCHAR(30) UNIQUE;


-- create a new database movies
CREATE DATABASE movies;

-- use the new databse movies
USE movies;

-- create table directors with id, director_name that is not null, notes
CREATE TABLE `directors` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `director_name` VARCHAR(50) NOT NULL,
    `notes` VARCHAR(100)
);

-- create table genres with id, genre name that is not null, notes
CREATE TABLE `genres` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `genre_name` VARCHAR(50) NOT NULL,
    `notes` VARCHAR(100)
);

-- create table categories with id, category name that is not null, notes
CREATE TABLE `categories` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `category_name` VARCHAR(50) NOT NULL,
    `notes` VARCHAR(100)
);

-- create table movies with id, title that is not null, director id, copyright year, length, genre id, cateogory id, rating, notes
CREATE TABLE `movies` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `title` VARCHAR(100) NOT NULL,
    `director_id` INT NOT NULL,
    `copyright_year` YEAR,
    `length` TIME,
    `genre_id` INT NOT NULL,
    `category_id` INT NOT NULL,
    `rating` FLOAT(1),
    `notes` VARCHAR(100)
);

-- populate table directors with 5 rows of data
INSERT INTO `directors` (`director_name`, `notes`)
VALUES
    ("Pesho", NULL),
    ("Gosho", NULL),
    ("Tosho", NULL),
    ("Banko", NULL),
    ("Vanko", NULL)
;

-- populate table genres with 5 rows of data
INSERT INTO `genres` (`genre_name`, `notes`)
VALUES
    ("Romantic", NULL),
    ("Triller", NULL),
    ("Action", NULL),
    ("Comedy", NULL),
    ("Fiction", NULL)
;

-- populate table category with 5 rows of data
INSERT INTO `categories` (`category_name`, `notes`)
VALUES
    ("Best movies of all time", NULL),
    ("Kids movies", NULL),
    ("Family movies", NULL),
    ("Low budget movies", NULL),
    ("Blockbusters", NULL)
;

-- populate table movies with 5 rows of data
INSERT INTO `movies` (`title`, `director_id`, `copyright_year`, `length`, `genre_id`, `category_id`, `rating`, `notes`)
VALUES
    ("My First Christmas", 1, 2022, NULL, 1, 1, NULL, NULL),
    ("Second Title", 1, 2018, NULL, 1, 2, NULL, NULL),
    ("Third Title", 1, 2022, NULL, 2, 5, NULL, NULL),
    ("Fourth", 1, 2022, NULL, 1, 3, NULL, NULL),
    ("Fifth", 1, 2022, NULL, 4, 1, NULL, NULL)
;

-- create new datase car_rental
CREATE DATABASE car_rental;

-- work with the new databse car rental
USE car_rental;

-- create table categories with id, category, daily rate, weekly rate, monthly rate, weekend rate
CREATE TABLE `categories`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `category` VARCHAR(50) NOT NULL,
    `daily_rate` FLOAT(2),
    `weekly_rate` FLOAT(2),
    `monthly_rate` FLOAT(2),
    `weekend_rate` FLOAT(2)
);

-- create table cars with id, plate_number, make, model, car_year, category_id, doors, picture, car_condition, available
CREATE TABLE `cars`(
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `plate_number` VARCHAR(10) NOT NULL,
    `make` VARCHAR(50),
    `model` VARCHAR(20),
    `car_year` YEAR,
    `category_id` INT,
    `doors` TINYINT,
    `picture` BLOB,
    `car_condition` VARCHAR(100),
    `available` BOOLEAN
);

-- create table employees with id, first_name, last_name, title, notes
CREATE TABLE `employees` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `first_name` VARCHAR(50),
    `last_name` VARCHAR(50),
    `title` VARCHAR(200),
    `notes` TEXT
);

-- create table customers with id, driver_licence_number, full_name, address, city, zip_code, notes
CREATE TABLE `customers` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `driver_licence_number` INT,
    `full_name` VARCHAR(50),
    `address` VARCHAR(200),
    `city` VARCHAR(100),
    `zip_code` TINYINT,
	`notes` TEXT
);

-- create table rental_orders with id, employee_id, customer_id, car_id, car_condition, tank_level, kilometrage_start, kilometrage_end, total_kilometrage, start_date, end_date, total_days, rate_applied, tax_rate, order_status, notes
CREATE TABLE `rental_orders` (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `employee_id` INT,
    `customer_id` INT,
    `car_id` INT,
    `car_condition` VARCHAR(200),
    `tank_level` FLOAT(3),
    `kilometrage_start` INT,
    `kilometrage_end` INT,
    `total_kilometrage` INT,
    `start_date` DATE,
    `end_date` DATE,
    `total_days` INT,
    `rate_applied` BOOLEAN,
    `tax_rate` FLOAT(2),
    `order_status` BOOLEAN,
    `notes` TEXT
);

-- populate table categories with 3 rows of data
INSERT INTO `categories` (`category`, `daily_rate`, `weekly_rate`, `monthly_rate`, `weekend_rate`)
VALUES
    ("Family Car", 12.5, 8.7, 5.256, 10.22),
    ("Sport Car", 12.5, 8.7, 5.256, 10.22),
    ("Truck", 12.5, 8.7, 5.256, 10.22)
;

-- populate table cars with 3 rows of data
INSERT INTO `cars` (`plate_number`, `make`, `model`, `car_year`, `category_id`, `doors`, `picture`, `car_condition`, `available`)
VALUES
    ("A1219BT", NULL, "Toyota", 2019, 1, NULL, NULL, NULL, True),
    ("A1219CT", NULL, "Nissan", 2022, 2, NULL, NULL, NULL, True),
    ("A1219PO", NULL, "Subaru", 2015, 3, NULL, NULL, NULL, True)
;

-- populate table employees with 3 rows of data
INSERT INTO `employees` (`first_name`, `last_name`, `title`, `notes`)
VALUES
    ("Tosho", "Toshev", "Boss", NULL),
    ("Gosho", "Goshev", "Sales", NULL),
    ("Pesho", "Peshev", "Security", NULL)
;

-- populate table customers with 3 rows of data
INSERT INTO `customers` (`driver_licence_number`, `full_name`, `address`, `city`, `zip_code`, `notes`)
VALUES
    (123456789, "Lilly Milly", NULL, NULL, NULL, NULL),
    (123456789, "Mimi Milly", NULL, NULL, NULL, NULL),
    (123456789, "Katy Milly", NULL, NULL, NULL, NULL)
;

-- populate table rental orders with 3 rows of data
INSERT INTO `rental_orders` (`employee_id`, `customer_id`, `car_id`, `car_condition`, `tank_level`, `kilometrage_start`, `kilometrage_end`, `total_kilometrage`, `start_date`, `end_date`, `total_days`, `rate_applied`, `tax_rate`, `order_status`, `notes`)
VALUES
    (1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL),
    (1, 1, 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
;


-- create a new database called soft uni
CREATE DATABASE `soft_uni`;

-- use softuni database
USE `soft_uni`;

-- create table towns with id and name
CREATE TABLE `towns` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(30)
);

-- create table addresses with id, address_text, town_id
CREATE TABLE `addresses` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `address_text` VARCHAR(30),
    `town_id` INT
);

-- create table departments with id, name
CREATE TABLE `departments` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `name` VARCHAR(30)
);

-- create table employees with id, first_name, middle_name, last_name, job_title, department_id, hire_date, salary, address_id 
CREATE TABLE `employees` (
    `id` INT AUTO_INCREMENT PRIMARY KEY,
    `first_name` VARCHAR(30) NOT NULL,
    `middle_name` VARCHAR(30),
    `last_name` VARCHAR(30) NOT NULL,
    `job_title` VARCHAR(30) NOT NULL,
    `department_id` INT NOT NULL,
    `hire_date` DATE,
    `salary` FLOAT,
    `address_id` INT    
);

-- insert data into towns table
INSERT INTO `towns` (`name`)
VALUES
    ('Sofia'),
    ('Plovdiv'),
    ('Varna'),
    ('Burgas')
;

-- insert data into departments table
INSERT INTO `departments` (`name`)
VALUES
    ('Engineering'), 
    ('Sales'), 
    ('Marketing'), 
    ('Software Development'), 
    ('Quality Assurance')
;

-- insert data into employees table
INSERT INTO `employees` (`first_name`, `middle_name`, `last_name`, `job_title`, `department_id`, `hire_date`, `salary`)
VALUES
    ("Ivan", "Ivanov", "Ivanov", ".NET Developer",	4,	"2013-02-01", 3500.00),
    ("Petar", "Petrov", "Petrov", "Senior Engineer", 1,	"2004-03-02", 4000.00),
    ("Maria", "Petrova", "Ivanova", "Intern", 5, "2016-08-28", 525.25),
	("Georgi", "Terziev", "Ivanov",	"CEO", 2, "2007-12-09", 3000.00),
    ("Peter", "Pan", "Pan", "Intern", 3, "2016-08-28", 599.88)
;

-- select all records from towns table
SELECT * FROM `towns`;

-- select all records from departments table
SELECT * FROM `departments`;

-- select all records from employees table
SELECT * FROM `employees`;

-- select all records from towns table and order them by name alphabetically
SELECT * FROM `towns`
ORDER BY `name` ASC;

-- select all records from departments table and order them by name alphabetically
SELECT * FROM `departments`
ORDER BY `name` ASC;

-- select all records from employees table and order them by salary in descending
SELECT * FROM `employees`
ORDER BY `salary` DESC;

-- select name coulmn from towns table and order them by name alphabetically
SELECT `name` FROM `towns`
ORDER BY `name` ASC;

-- select name coulmn from departments table and order them by name alphabetically
SELECT `name` FROM `departments`
ORDER BY `name` ASC;

-- select all records from employees table and order them by salary in descending
SELECT `first_name`, `last_name`, `job_title`, `salary` FROM `employees`
ORDER BY `salary` DESC;

-- increase the salary of all employees by 10%
UPDATE `employees` 
SET `salary` = `salary` * 1.1;

-- select only salary column from the employees table
SELECT `salary` FROM `employees`;

-- delete all data from employees table
TRUNCATE TABLE `employees`;
