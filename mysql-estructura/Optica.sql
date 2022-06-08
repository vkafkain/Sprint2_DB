-- CONFIG
DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica;
USE optica;
-- SCHEMA CREATION
CREATE TABLE adreça (
    adreça_id INT NOT NULL AUTO_INCREMENT,
    carrer VARCHAR(255),
    numero INT,
    pis INT,
    porta INT,
    ciutat VARCHAR(255),
    codi_postal INT,
    pais VARCHAR(255),
    PRIMARY KEY(adreça_id)
);
CREATE TABLE empleat (
    empleat_id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255),
    PRIMARY KEY(empleat_id)
);
CREATE TABLE proveidors (
    proveidors_id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    telefon INT,
    fax INT,
    NIF VARCHAR(255) NOT NULL,
    adreça_id INT NOT NULL,
    PRIMARY KEY(proveidors_id),
    FOREIGN KEY(adreça_id) REFERENCES adreça (adreça_id)
);
CREATE TABLE marca (
    marca_id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    proveidors_id INT NOT NULL,
    PRIMARY KEY(marca_id),
    FOREIGN KEY(proveidors_id) REFERENCES proveidors (proveidors_id)
);
CREATE TABLE clients (
    clients_id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255),
    adreça_postal VARCHAR(255),
    telefon INT,
    correu_electronic VARCHAR(255),
    data_de_registre DATE,
    client_id_recomanat INT,
    empleat_id INT NOT NULL,
    PRIMARY KEY(clients_id),
    FOREIGN KEY(client_id_recomanat) REFERENCES clients(clients_id),
    FOREIGN KEY(empleat_id) REFERENCES empleat(empleat_id)
);
CREATE TABLE ulleres (
    ulleres_id INT NOT NULL AUTO_INCREMENT,
    graduacio_dreta DECIMAL(10,0),
    graduacio_esquerra DECIMAL(10,0),
    tipus_de_montura ENUM('flotant', 'pasta', 'metal·lica'),
    color_montura VARCHAR(255),
    color_vidres VARCHAR(255),
    preu DECIMAL(10,0),
    data_venda DATE NOT NULL,
    marca_id INT NOT NULL,
    clients_id INT NOT NULL,
    empleat_id INT NOT NULL,
    PRIMARY KEY(ulleres_id),
    FOREIGN KEY(marca_id) REFERENCES marca (marca_id),
    FOREIGN KEY(clients_id) REFERENCES clients(clients_id),
    FOREIGN KEY(empleat_id) REFERENCES empleat(empleat_id)
);
-- INSERT DATA TO DATABASE
INSERT INTO adreça (carrer, numero, pis, porta, ciutat, codi_postal, pais)
VALUES ('Avinguda de la piruleta',4, 1, 4, 'Sprindfield', 98765, 'EEUU'),
('Carrer petrixol',32, 4, 1, 'Barcelona', 08001, 'Espanya'),
('Carrer tapioles',9, 1, 4, 'Barcelona', 08004, 'Espanya'),
('Elm Street',239, 12, 2, 'Springwood', 91234, 'EEUU'),
('Abbey Road',122, 7, 1, 'London', 12453, 'UK'),
('Calle del llano',2, 1, 2, 'Teruel', 02391, 'Espanya');
INSERT INTO empleat(nom)
VALUES ('Homer Simpson'), 
('Petter Griffin'), 
('Betty Smith'), 
('Salvador Dali');
INSERT INTO proveidors(nom, telefon, fax, NIF, adreça_id)
VALUES ('Orcs SL', 656432187, 87623341, 'D36123161NJM', 1),
('Goblins Enterprise', 765422338, 923392239, 'Y2382183812LKD', 2),
('Trolls SA', 632319315, 3221111, 'W1231393131KKJ', 3),
('Humans Co', 623131333, 38388277, 'Z849231644AS', 4),
('Dragons SL', 655532122, 932228112, 'A2399911S', 5),
('Elfs International', 676890976, 93445762, 'R123913919GF', 6);
INSERT INTO clients(nom, adreça_postal, telefon, correu_electronic, data_de_registre, client_id_recomanat, empleat_id)
VALUES ('Jan Lopez', 'CP09388', 73623212, 'jan@gmail.com', '2000-02-12', NULL, 1),
('Alba Ferrer', 'CP23471', 68837272, 'alba@gmail.com', '2012-12-03', 1, 2),
('Pere Quart', 'CP12234', 63609390, 'pere@gmail.com', '2008-03-09', 2, 3),
('Jarjar Vincs', 'CP60493', 666728798, 'vinks@gmail.com', '2020-06-09', 3, 4),
('Valeria Lopez', 'CP03211', 656232122, 'valeria@gmail.com', '2021-04-10', 4, 1),
('Minerva Puig', 'CP09931', 721223123, 'miner@gmail.com', '2007-11-22', 1, 2);
INSERT INTO marca(nom, proveidors_id)
VALUES ('Acme', 1),
('Warner Optics', 2),
('Rayban', 3),
('Nike', 4),
('Jackson', 5),
('Adidas', 6);
INSERT INTO ulleres(graduacio_dreta, graduacio_esquerra, tipus_de_montura, color_montura, color_vidres, preu, data_venda, marca_id, clients_id, empleat_id)
VALUES(0.3, 0.1, 'metal·lica', 'verd', 'negre', 120, '2003-05-23', 1, 1, 1),
(0.6, 2.1, 'flotant', 'negre', 'vermell', 140, '2013-02-19', 2, 2, 2),
(1.8, 2.9, 'pasta', 'groc', 'gris', 240, '2015-06-26', 3, 3, 3),
(0.9, 1.1, 'pasta', 'blau', 'blau', 90, '2013-02-17', 4, 1, 4),
(0.1, 0.3, 'metal·lica', 'negre', 'negre', 100, '2010-08-23', 5, 5, 1),
(2.8, 3.3, 'flotant', 'blanc', 'negre', 240, '2015-05-23', 6, 1, 3);

-- SELECT DATA FROM DATABASE
SELECT clients.nom, ulleres.data_venda, ulleres.preu, marca.nom, ulleres.color_montura, ulleres.color_vidres, ulleres.tipus_de_montura
FROM ulleres
JOIN marca ON ulleres.marca_id = marca.marca_id
JOIN clients ON clients.clients_id = ulleres.clients_id AND clients.nom = 'Jan Lopez';
SELECT empleat.nom, ulleres.data_venda, marca.nom, ulleres.tipus_de_montura, ulleres.color_montura, ulleres.color_vidres, ulleres.preu
FROM ulleres
JOIN marca ON ulleres.marca_id = marca.marca_id
JOIN empleat ON ulleres.empleat_id = empleat.empleat_id
WHERE ulleres.empleat_id = 3 AND YEAR(data_venda) = 2015;
SELECT proveidors.nom, proveidors.NIF, marca.nom, ulleres.data_venda
FROM proveidors
JOIN marca ON proveidors.proveidors_id = marca.proveidors_id
JOIN ulleres ON marca.marca_id = ulleres.marca_id

