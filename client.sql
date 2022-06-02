-- authentification

>mysql -u root -- si l'utilisateur n'a pas de mot de passe

>mysql -u root -p -- si l'utilisateur n'a pas de mot de passe

-- Lister toutes les bases de données

SHOW DATABASES.

-- Création d'une table
-- id est un entier non null auto incrémenté de 1 c'est une clé primaire
-- Unique pour une contrainte d'unicité

CREATE TABLE clients(
  id INTEGER NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom VARCHAR(50) NOT NULL,
  prenon VARCHAR(50) NOT NULL,
  email VARCHAR(70),
  telephone VARCHAR(20) NOT NULL
);

-- Voir une description de ma table

DESC clients;
DESCRIBE clients;