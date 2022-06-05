CREATE DATABASE TP2;

USE TP2;

CREATE TABLE clients(
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  companyName VARCHAR(30),
  firstName VARCHAR(30),
  lastName VARCHAR(30),
  email VARCHAR(30),
  phone VARCHAR(20),
  address VARCHAR(30),
  zipCode VARCHAR(10),
  city VARCHAR(30),
  country VARCHAR(30),
  state INTEGER(1)
);

CREATE TABLE orders(
  id integer NOT NULL AUTO_INCREMENT PRIMARY KEY,
  typePresta VARCHAR(30),
  designation VARCHAR(30),
  clientId integer,
  nbDays INTEGER,
  unitPrice FLOAT(10,2),
  state INTEGER(1),
  FOREIGN KEY(clientId) REFERENCES clients(id)
);

INSERT INTO clients (companyName,firstName,lastName,email,phone,address,zipCode,city,country,state)
values ("Capgemini","Fabrice","Martin","martin@mail.com","06 56 85 84 33", "abc", "xyz","Nantes","France",0),
("M2I Formation", "Julien", "Lamard", "lamard@mail.com", "06 11 22 33 44", "abc", "xyz", "Paris", "France",1),
("ATOS", "Jean", "Zozor", "jzozor@mail.com", "06 09 08 07 06", "quelque part", "tre", "Bastia", "France", 1),
("SOPRA STRERIA", "Anthony", "Toto", "toto@mail.com", "05 61 55 33 33", "Rue de l'Humanité", "zzz", "Colomier", "France", 0);

INSERT INTO orders(typePresta,designation,clientId,nbDays,unitPrice,state)
VALUES("Formation","Angular init",2,3,1200,0),
("Formation","React avancé",2,3,1000,2),
("Coaching","React Techlead",1,20,900,2),
("Coaching","Nest.js Techlead",1,50,800,1);

SELECT orders.typePresta, orders.designation 
FROM clients JOIN orders ON clients.id=orders.clientId WHERE orders.typePresta="Formation" AND clients.companyName="M2I Formation";


SELECT DISTINCT clients.companyName, clients.firstName,clients.lastName
FROM clients JOIN orders ON clients.id=orders.clientId WHERE orders.typePresta="Coaching";

SELECT DISTINCT clients.firstName,clients.lastName, clients.phone,clients.email
FROM clients JOIN orders ON clients.id=orders.clientId WHERE orders.typePresta="Coaching" AND orders.designation="React Techlead";

CREATE VIEW v_prices AS SELECT typePresta, designation, (unitPrice*nbDays) AS totalExcludeTaxe, (unitPrice*nbDays*1.2) AS totalWithTaxe, state
FROM orders;

SELECT typePresta, designation  FROM v_prices WHERE totalWithTaxe>30000 AND state=2;