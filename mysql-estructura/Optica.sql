
DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica;
USE optica;
CREATE TABLE proveidors (
    id_proveidors INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    carrer VARCHAR(255),
    numero INT,
    porta INT,
    ciutat VARCHAR(255),
    codi_postal INT,
    pais VARCHAR(255),
    telefon INT,
    fax INT,
    NIF VARCHAR(255) NOT NULL,
    PRIMARY KEY(id_proveidors)
);
CREATE TABLE clients (
    id_clients INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255),
    adreça_postal VARCHAR(255),
    telefon INT,
    correu_electronic VARCHAR(255),
    data_de_registre DATE,
    id_client_recomenat INT,
    empleat_id INT,
    data_venda DATE,
    PRIMARY KEY(id_clients)
);
CREATE TABLE empleat (
    id_empleat INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255),
    cognoms VARCHAR(255),
    PRIMARY KEY(id_empleat)
);
CREATE TABLE ulleres (
    id_ulleres INT NOT NULL AUTO_INCREMENT,
    marca VARCHAR(255),
    graduacio_dreta DECIMAL(10,0),
    graduacio_esquerra(10,0)
    tipus_de_monstura size ENUM('flotant', 'pasta', 'metal·lica') NOT NULL,

)
