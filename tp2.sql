CREATE DATABASE TP2

USE DATABASE TP2

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
  client_id integer,
  nbDays INTEGER,
  unitPrice FLOAT(5,2),
  state INTEGER(1),
  FOREIGN KEY(clientId) REFERENCES clients(id)
);