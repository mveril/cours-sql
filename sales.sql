
-- 1.1 Créer une base de données appelée sales

CREATE DATABASE Sales;

USE Sales;

 -- 1.2 Créer une table appelée telephones avec les colonnes suivantes (cf exo)

CREATE TABLE telephones(
id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
name VARCHAR(30) NOT NULL,
manufacturer VARCHAR(30) NOT NULL,
price FLOAT(4,2) NOT NULL,
units_sold INTEGER(10) NOT NULL
);

-- 1.3 Insérer les données suivantes (cf exo)

INSERT INTO telephones(name,manufacturer,price,units_sold) values
("N1280","Nokia",199,1925),
("IPhone 4","Apple",399,9436),
("Galaxy S5","Samsung",299,2359),
("S5620 Monte","Samsung",250,2385),
("N8","Nokia",150,7543),
("Droid","Motorola",150,8395),
("IPhone 13 Pro Max","Apple",1300,12849),
("Galaxy Note 20","Samsung",1100,10353)
;

-- 2.1 Ecrire une requête pour liste tous les modèles de téléphones

SELECT * FROM telephones;

-- 2.2 Ecrire une requête pour lister tous les telephone(name, manufacturer) de tous lestéléphone dont le prix est supérieur à 200€

SELECT name,manufacturer FROM telephones WHERE price>200;

-- 2.3 Ecrire une requête pour lister tous les telephones (name,manufacturer) de tous les téléphones dont le prix est varie entre 150 et 200€

SELECT name,manufacturer FROM telephones WHERE price>=150 AND price<=200;

-- On peut aussi écrire un intervalle avec la fonction <BETWEEN> qui évite les erreurs de syntaxe sur les conditions:

SELECT name,manufacturer FROM telephones WHERE price BETWEEN 150 AND 200;

-- 2.4 Lister tous les téléphones de marque samsung et Apple

SELECT * FROM telephones WHERE manufacturer="Apple" OR manufacturer="Samsung";

-- On peut regrouper toutes les conditions ici avec <IN> plutôt que d'utiliser des OR :

SELECT * FROM `telephones` WHERE manufacturer IN("Apple","Samsung");

-- LMD 3 : Fin de l'exercice, suite du cours

-- 3.1 On peut vouloir afficher la liste sous un certain ordre (prix)

-- Pour cela, on utilise <ORDER BY> puis la condition d'ordre <prix> et on termine par l'ordre ascendant <ASC> ou descendant <DESC>

SELECT id,name,manufacturer,price FROM telephones ORDER BY price ASC;

-- On peut aussi ajouter un deuxième niveau de critère pour l'ordre (exemple, on veut trier par prix, puis ensuite par fabriquant)

SELECT id,name,manufacturer,price FROM telephones ORDER BY price ASC, manufacturer ASC;

-- 3.2 On veut maintenant connaitre le chiffre d'affaire des téléphones en fonction de leur prix et du nombre vendu

-- Il suffit de faire la multiplication <*> du prix et des unités vendues dans la commande <SELECT> pas après !

SELECT name, manufacturer, price*units_sold FROM telephones;

-- 3.3 Ici, l'affichage du résultat n'est pas très joli, on peut donc choisir de renommer 1 ou plusieurs colonnes grâce à un alias.

-- Il suffit de mettre le nom présent dans la table <price> suivi de <AS> et du nom d'affichage souhaité <prix>

SELECT name as modele, manufacturer as constructeur, price AS prix, units_sold AS unités_vendues, price*units_sold AS chiffre_affaire 
FROM telephones;

-- 3.4 On souhaite désormais afficher le prix suivi de euros, ou la marque d'un téléphone suivi d'un modèle

-- On utilise la requête de concaténation <CONCAT> suivi des colonnes ou arguments que l'on veut concaténer

SELECT CONCAT(manufacturer, " ", name) AS nom, CONCAT(price,"€") AS prix FROM telephones;

-- 3.5 Création d'une vue (view) : permet de créer une requête à partir du résultat d'une requête déjà faite 

-- Cela évite de réécrire des requêtes longues

CREATE VIEW v_revenu_total AS 
SELECT CONCAT(manufacturer, " ", name) AS nom, 
CONCAT(price," €") AS prix, 
units_sold AS unites_vendues,
CONCAT(units_sold*price," €") AS chiffre_affaire 
FROM telephones;

-- On peut ensuite afficher la vue

SELECT * FROM v_revenu_total;

-- 3.6 Elimination des duplicats pour afficher seulement 1 exemplaire d'une colonne (on veut par exemple lister les fabriquants)

-- On utilise la requête <DISTINCT>

SELECT DISTINCT(manufacturer) FROM telephones;

-- 3.7 On souhaite compter le nombre de records total (par exemple le nombre de tel)

-- On utilise <COUNT> 

SELECT COUNT(*) FROM telephones;

-- Ou selon une contrainte spécifique (le nombre de téléphones de la marque Apple)

SELECT COUNT(*) FROM telephones WHERE manufacturer="Apple";

-- 3.8 On souhaite afficher le total des ventes de tout les tel

-- On utilise la requête <SUM> puis ce que l'on veut additionner ()

SELECT SUM(units_sold) FROM telephones;

-- 3.9 Afficher la valeur moyenne d'une colonne

-- Requête average <AVG>

SELECT AVG(units_sold) FROM telephones;

-- 3.10 On peut de la même manière afficher le minimum <MIN> et le maximum <MAX>:

SELECT MIN(units_sold) FROM telephones;
SELECT MAX(units_sold) FROM telephones;