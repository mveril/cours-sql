CREATE DATABASES sales

USE sales

CREATE TABLE telephones(
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(30) NOT NULL,
  manufacturer VARCHAR(30) NOT NULL,
  price FLOAT NOT NULL,
  units_sold INTEGER NOT NULL
);

INSERT INTO telephones(name,manufacturer,price,units_sold)
values("N1280","Nokia",199,1925),
("iPhone 4","Apple",399,9436),
("Galaxy S 5","Samsung",299,2359),
("S5620 Monte","Samsung",250,2385),
("N8","Nokia",150,7543);

INSERT INTO telephones(name,manufacturer,price,units_sold)
values("Droid","Motorola",150,8395),
("iPhone 13 ProMax","Apple",1300,12849),
("Galaxy Note 20","Samsung",1100,10353);

select name, manufacturer from telephones;

select name, manufacturer from telephones WHERE price>200;

select name, manufacturer from telephones WHERE price>150 AND price<200

select name, manufacturer from telephones WHERE manufacturer="Samsung" AND manufacturer="Apple";