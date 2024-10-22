DROP DATABASE IF EXISTS banque;

CREATE DATABASE IF NOT EXISTS banque;

USE banque;

DROP TABLE IF EXISTS client;

CREATE TABLE IF NOT EXISTS client (
    id int,
    nom varchar(50),
    prenom varchar(50),
    ville varchar(25),
    age int (3)
);
DROP TABLE IF EXISTS compte;
CREATE TABLE IF NOT EXISTS compte (
    type_compte varchar (20),
    id_cli int,
    solde decimal (12,2)
);
INSERT INTO client (id, nom, prenom, ville, age)
VALUES
(1, 'Parker', 'Tony', 'Nantes', 32),
(2, 'Benzema', 'Karim', 'Lille', 18),
(3, 'Batum', 'Nicolas', 'Angers', 27),
(4, 'Cadamuro', 'Louisa', 'Toulouse', 28);
 
 
INSERT INTO compte (type_compte, id_cli, solde)
VALUES
('Compte Courant', 1, 8524.50),
('Livret A', 1, 35327.00),
('Compte courant', 2, 15040.00),
('Compte Courant', 3, -2535.10),
('Livret A', 4, 2527.00),
('Compte Courant', 4, 12800.00);

INSERT INTO client (id, nom, prenom, ville, age)
VALUES
(5, 'Décosse', 'Lucie', 'Angers', 24);
 
 