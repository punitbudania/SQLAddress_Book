UC_1
CREATE DATABASE address_book_service;
SHOW DATABASES;
USE address_book_service;

UC_2
CREATE TABLE address_book
(
 id INT unsigned NOT NULL AUTO_INCREMENT,
 firstName VARCHAR(100) NOT NULL,
 lastName VARCHAR(100) NOT NULL,
 address VARCHAR(100) NOT NULL,
 city VARCHAR(100) NOT NULL,
 state VARCHAR(100) NOT NULL,
 zip BIGINT NOT NULL,
 phoneNo BIGINT NOT NULL,
 email VARCHAR(100) NOT NULL,
 PRIMARY KEY (id)
);

UC_3
INSERT INTO address_book (firstName, lastName, address, city, state, zip, phoneNo, email) VALUES
 ('Rohit', 'Kumar', 'Vyas colony', 'Puri', 'Orissa', 110016, 8327342983, 'rkumar@gmail.com'),
 ('Arif', 'Khan', 'Vikas colony', 'Jaipur', 'Rajasthan', 337801, 37602830234, 'akhan@gmail.com'),
 ('Harkirat', 'Singh', 'Bilal colony', 'Panji', 'Goa', 327641, 48709042947, 'hsingh@gmail.com');

UC_4
UPDATE address_book SET address = "Will Colony" WHERE firstName = "Arif";

UC_5
DELETE FROM address_book WHERE id = 3;

UC_6
SELECT * FROM address_book WHERE city = "Puri";

UC_7
SELECT COUNT(*) FROM address_book WHERE state = "Goa";

UC_8
SELECT * FROM address_book WHERE city = "Puri" ORDER BY firstName;

UC_9
ALTER TABLE address_book ADD bookName VARCHAR(100) NOT NULL AFTER id;
ALTER TABLE address_book ADD type VARCHAR(100) NOT NULL AFTER bookName;

UC_10
SELECT COUNT(*) FROM address_book WHERE type = "Family";

UC_11
UPDATE address_book SET type = "Family" WHERE firstName = "Rohit";
INSERT INTO address_book (type, firstName, lastName, address, city, state, zip, phoneNo, email) VALUES
 ('Friend', 'Rohit', 'Kumar', 'Vyas colony', 'Puri', 'Orissa', 110016, 8327342983, 'rkumar@gmail.com');
 
UC_12
CREATE TABLE contact_address
(
 id INT unsigned NOT NULL,
 address VARCHAR(100) NOT NULL,
 city VARCHAR(100) NOT NULL,
 state VARCHAR(100) NOT NULL,
 zip BIGINT NOT NULL,
 phoneNo BIGINT NOT NULL,
 email VARCHAR(100) NOT NULL,
 FOREIGN KEY (id) REFERENCES address_book(id) ON DELETE CASCADE
);
CREATE TABLE types
(
 type_id INT NOT NULL,
 type_name VARCHAR(100),
 PRIMARY KEY (type_id)
);
alter table address_book add foreign key (type_id) references types(type_id) on delete cascade;
