DROP DATABASE if EXISTS pizzeria;
CREATE DATABASE pizzeria;
USE pizzeria;
CREATE TABLE provincia (
    provincia_id INT NOT NULL AUTO_INCREMENT
    nom VARCHAR(255)
    PRIMARY KEY(provincia_id)
);
CREATE TABLE localitat (
    localitat_id INT NOT NULL AUTO_INCREMENT
    nom VARCHAR(255)
    provincia_id INT NOT NULL
    PRIMARY KEY(localitat)
    FOREIGN KEY(provincia_id)
);
CREATE TABLE client (
    client_id INT NOT NULL AUTO_INCREMENT
    nom VARCHAR(255)
    cognoms VARCHAR(255)
    adreça VARCHAR(255)
    telefon INT
    localitat_id INT NOT NULL
    PRIMARY KEY(client_id)
    FOREIGN KEY(localitat_id)
);
CREATE TABLE botiga(
    botiga_id INT NOT NULL AUTO_INCREMENT
    adreça VARCHAR(255)
    codi_postal INT
    localitat_id INT NOT NULL
    PRIMARY KEY(botiga_id)
    FOREIGN KEY(localitat_id)
);
CREATE TABLE empleat(
    empleat_id INT NOT NULL AUTO_INCREMENT
    nom VARCHAR(255)
    cognoms VARCHAR(255)
    NIF VARCHAR(255)
    telefon INT
    botiga INT NOT NULL
    PRIMARY KEY(empleat_id)
    FOREIGN KEY(botiga_id)
);
CREATE TABLE comanda_domicili (
    comanda_domicili_id INT NOT NULL AUTO_INCREMENT
    data_entrega DATE
    client_id INT NOT NULL
    PRIMARY KEY(comanda_domicili_id)
    FOREIGN KEY(client_id)
);
)


