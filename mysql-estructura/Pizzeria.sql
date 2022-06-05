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
    FOREIGN KEY(provincia_id) REFERENCES provincia(provincia_id)
);
CREATE TABLE client (
    client_id INT NOT NULL AUTO_INCREMENT
    nom VARCHAR(255)
    cognoms VARCHAR(255)
    adreça VARCHAR(255)
    telefon INT
    codi_postal INT
    localitat_id INT NOT NULL
    PRIMARY KEY(client_id)
    FOREIGN KEY(localitat_id) REFERENCES localitat(localitat_id)
);
CREATE TABLE botiga(
    botiga_id INT NOT NULL AUTO_INCREMENT
    adreça VARCHAR(255)
    codi_postal INT
    localitat_id INT NOT NULL
    PRIMARY KEY(botiga_id)
    FOREIGN KEY(localitat_id) REFERENCES localitat(localitat_id)
);
CREATE TABLE empleat(
    empleat_id INT NOT NULL AUTO_INCREMENT
    nom VARCHAR(255)
    cognoms VARCHAR(255)
    NIF VARCHAR(255)
    telefon INT
    tipus_treballador ENUM('repartidor', 'cuiner')
    botiga_id INT NOT NULL
    PRIMARY KEY(empleat_id)
    FOREIGN KEY(botiga_id) REFERENCES botiga(botiga_id)
);
CREATE TABLE comanda_domicili (
    comanda_domicili_id INT NOT NULL AUTO_INCREMENT
    empleat_id INT NOT NULL
    comanda_id
    PRIMARY KEY(comanda_domicili_id)
    FOREIGN KEY(empleat_id) REFERENCES empleat_id(empleat_id)
);
CREATE TABLE comanda (
    comanda_id INT NOT NULL AUTO_INCREMENT
    data DATE
    hora DATE TIME
    tipus_comanda ENUM('domicili', 'botiga')
    preu_total INT  
    client_id INT NOT NULL
    botiga_id INT NOT NULL
    empleat_id INT NOT NULL
    comanda_domicili_id INT 
    PRIMARY KEY(comanda_id)
    FOREIGN KEY(client_id) REFERENCES client(client_id)
    FOREIGN KEY(botiga_id) REFERENCES botiga(botiga_id)
    FOREIGN KEY(empleat_id) REFERENCES empleat(empleat_id)
    FOREIGN KEY(comanda_domicili_id) REFERENCES comanda_domicili(comanda_domicili_id)
);
CREATE TABLE categoria_pizzes (
    categoria_pizzes_id INT NOT NULL AUTO_INCREMENT
    nom VARCHAR(255)
    PRIMARY KEY(categoria_pizzes_id)
);
CREATE TABLE productes (
    productes_id INT NOT NULL AUTO_INCREMENT
    tipus_producte ENUM ('pizza', 'hamburguesa', 'beguda')
    nom VARCHAR(255)
    descripcio VARCHAR(255)
    imatge BLOB
    preu INT
    categoria_pizzes_id INT NOT NULL
    PRIMARY KEY(productes_id)
    FOREIGN KEY(categoria_pizzes_id) categoria_pizzes(categoria_pizzes_id)
);
CREATE TABLE quantitat_producte (
    quantitat_producte_id INT NOT NULL AUTO_INCREMENT
    quantitat INT
    producte_id INT NOT NULL
    comanda_id INT NOT NULL
    PRIMARY KEY(quantitat_producte_id)
    FOREIGN KEY(producte_id) producte(producte_id)
    FOREIGN KEY(comanda_id) comanda(producte_id)
);