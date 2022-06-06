DROP DATABASE if EXISTS pizzeria;
CREATE DATABASE pizzeria;
USE pizzeria;
CREATE TABLE provincia (
    provincia_id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    PRIMARY KEY(provincia_id)
);
CREATE TABLE localitat (
    localitat_id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    provincia_id INT NOT NULL,
    PRIMARY KEY(localitat_id),
    FOREIGN KEY(provincia_id) REFERENCES provincia(provincia_id)
);
CREATE TABLE client (
    client_id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    cognoms VARCHAR(255) NOT NULL,
    adreça VARCHAR(255) NOT NULL,
    telefon INT NOT NULL,
    codi_postal INT NOT NULL,
    localitat_id INT NOT NULL,
    PRIMARY KEY(client_id),
    FOREIGN KEY(localitat_id) REFERENCES localitat(localitat_id)
);
CREATE TABLE botiga(
    botiga_id INT NOT NULL AUTO_INCREMENT,
    adreça VARCHAR(255) NOT NULL,
    codi_postal INT NOT NULL,
    localitat_id INT NOT NULL,
    PRIMARY KEY(botiga_id),
    FOREIGN KEY(localitat_id) REFERENCES localitat(localitat_id)
);
CREATE TABLE empleat(
    empleat_id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    cognoms VARCHAR(255) NOT NULL,
    NIF VARCHAR(255) NOT NULL,
    telefon INT NOT NULL,
    tipus_treballador ENUM('repartidor', 'cuiner') NOT NULL,
    botiga_id INT NOT NULL,
    PRIMARY KEY(empleat_id),
    FOREIGN KEY(botiga_id) REFERENCES botiga(botiga_id)
);
CREATE TABLE comanda_domicili (
    comanda_domicili_id INT NOT NULL AUTO_INCREMENT,
    empleat_id INT NOT NULL,
    comanda_id INT NOT NULL,
    PRIMARY KEY(comanda_domicili_id),
    FOREIGN KEY(empleat_id) REFERENCES empleat(empleat_id)
);
CREATE TABLE comanda (
    comanda_id INT NOT NULL AUTO_INCREMENT,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    tipus_comanda ENUM('domicili', 'botiga') NOT NULL,
    preu_total INT NOT NULL,
    client_id INT NOT NULL,
    botiga_id INT,
    empleat_id INT NOT NULL,
    comanda_domicili_id INT,
    PRIMARY KEY(comanda_id),
    FOREIGN KEY(client_id) REFERENCES client(client_id),
    FOREIGN KEY(botiga_id) REFERENCES botiga(botiga_id),
    FOREIGN KEY(empleat_id) REFERENCES empleat(empleat_id),
    FOREIGN KEY(comanda_domicili_id) REFERENCES comanda_domicili(comanda_domicili_id)
);
CREATE TABLE categoria_pizzes (
    categoria_pizzes_id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255),
    PRIMARY KEY(categoria_pizzes_id)
);
CREATE TABLE productes (
    productes_id INT NOT NULL AUTO_INCREMENT,
    tipus_producte ENUM ('pizza', 'hamburguesa', 'beguda'),
    nom VARCHAR(255),
    descripcio VARCHAR(255),
    imatge BLOB,
    preu INT,
    categoria_pizzes_id INT,
    PRIMARY KEY(productes_id),
    FOREIGN KEY(categoria_pizzes_id) REFERENCES categoria_pizzes(categoria_pizzes_id)
);
CREATE TABLE quantitat_producte (
    quantitat_producte_id INT NOT NULL AUTO_INCREMENT,
    quantitat INT,
    productes_id INT NOT NULL,
    comanda_id INT NOT NULL,
    PRIMARY KEY(quantitat_producte_id),
    FOREIGN KEY(productes_id) REFERENCES productes(productes_id),
    FOREIGN KEY(comanda_id) REFERENCES comanda(comanda_id)
);

INSERT INTO provincia(nom)
VALUES ('Barcelona'), ('Tarragona'), ('Lleida'), ('Girona');
INSERT INTO localitat (nom, provincia_id)
VALUES ('Barcelona', 1), ('Hospitalet', 1), ('Reus', 2), ('Amposta', 2), ('Alcoletge', 3), ('Almacella', 3), ('Palamos', 4), ('Pals', 4);
INSERT INTO client (nom, cognoms, adreça, telefon, codi_postal, localitat_id)
VALUES ('Mario', 'Bros', 'Carrer toat 4', 912234555, 6789, 3),
('Antoni', 'Soprano', 'Avinguda tirito 32', 98291131, 8917, 6),
('Jurgen', 'Klopp', 'Carrer del mort 12', 93234555, 08004, 1),
('Minerva', 'Moles', 'Carrer Andorra 2', 98013813, 09001, 2),
('Montse', 'Jimenez', 'Carrer Felip 24', 12334888, 89898, 4),
('Angels', 'Castelo', 'Carrer bruseles 99', 98198833, 744661, 5),
('Ruth', 'Lopez', 'Avinguda ozo', 981838381, 12313, 7),
('Luigi', 'Bros', 'Carrer Castell 24', 889990011, 233111, 8);
INSERT INTO botiga (adreça, codi_postal, localitat_id)
VALUES ('Avinguda diagonal 33', '08012', 1),
('Carrer Estiu 12', '09888', 3),
('Plaça del centre 2', '41244', 5),
('Carrer Manresa', '65553', 8);
INSERT INTO empleat (nom, cognoms, NIF, telefon, tipus_treballador, botiga_id)
VALUES ('John', 'Wick', '33492192S', 675881124, 'cuiner', 1),
('Alexia', 'Puig', '27999099Q', 687561209, 'cuiner', 2),
('Marçal', 'Andreu', '83872890E', 789092312, 'repartidor', 3),
('Johnny', 'Mayer', '18383133E', 666939312, 'repartidor', 4),
('Andrea', 'Font', '28318844S', 678593213, 'repartidor', 1),
('Victor', 'Lopez', '12334912T', 666768909, 'repartidor', 2),
('Marçal', 'Andreu', '1391999G', 678049222, 'cuiner', 3),
('Claudia', 'Martinez', '12334449Y', 71248222, 'cuiner', 4);
INSERT INTO comanda_domicili (empleat_id, comanda_id)
VALUES(3, 1), (4, 2), (5, 3), (6, 4);
INSERT INTO comanda (data, hora, tipus_comanda, preu_total, client_id, botiga_id, empleat_id, comanda_domicili_id)
VALUES('2021-02-12', '12:32:00', 'botiga', 33, 1, 1, 1, NULL),
('2021-04-22', '14:02:00', 'botiga', 20, 2, 2, 2, NULL),
('2021-01-03', '21:06:00', 'domicili', 12, 3, 3, 3, 1),
('2021-02-13', '20:00:00', 'domicili', 120, 4, 4, 4, 2);
INSERT INTO categoria_pizzes (nom)
VALUES('Especial'), ('La del mes'), ('Extra Picant'), ('Infantil');
INSERT INTO productes (tipus_producte, nom, descripcio, imatge, preu, categoria_pizzes_id)
VALUES ('pizza', 'familiar', 'Pizza gran', NULL, 19, 1),
('pizza', 'petita', 'Pizza petita', NULL, 7, 2),
('hamburguesa', 'cheese burguer', 'Hamburguesa amb formatge', NULL, 12, NULL),
('beguda', 'aigua', 'H2O', NULL, 2, NULL);
INSERT INTO quantitat_producte(quantitat, productes_id, comanda_id)
VALUES (3, 1, 1), (2, 2, 2), (1, 3, 3), (5, 4, 4);


