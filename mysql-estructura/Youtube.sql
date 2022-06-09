-- CONFIG
DROP DATABASE if EXISTS youtube;
CREATE DATABASE youtube;
USE youtube;
-- SCHEMA CREATION
CREATE TABLE usuari (
    usuari_id INT NOT NULL AUTO_INCREMENT,
    email VARCHAR(255) NOT NULL,
    contrasenya VARCHAR(255) NOT NULL,
    nom VARCHAR(255) NOT NULL,
    data_naixement DATE NOT NULL,
    sexe ENUM('home', 'dona') NOT NULL,
    pais VARCHAR(255) NOT NULL,
    codi_postal INT NOT NULL,
    PRIMARY KEY(usuari_id)
);
CREATE TABLE videos (
    video_id INT NOT NULL AUTO_INCREMENT,
    titol VARCHAR(255) NOT NULL,
    descripcio VARCHAR(255) NOT NULL,
    tamany_arxiu VARCHAR(255) NOT NULL,
    nom_arxiu VARCHAR(255) NOT NULL,
    durara TIME NOT NULL,
    thumnail VARCHAR(255) NOT NULL,
    nombre_reproduccions INT NOT NULL,
    estat ENUM('public', 'privat') NOT NULL,
    usuari_id INT NOT NULL,
    PRIMARY KEY(video_id),
    FOREIGN KEY(usuari_id) REFERENCES usuari(usuari_id)
);
CREATE TABLE etiquetes (
    etiqueta_id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    videos_id INT NOT NULL,
    PRIMARY KEY(etiqueta_id)
    FOREIGN KEY(videos_id) REFERENCES videos(video_id)
);
CREATE TABLE comentari (
    comentari_id INT NOT NULL AUTO_INCREMENT,
    text_comentari VARCHAR(255) NOT NULL,
    data DATE NOT NULL,
    hora TIME NOT NULL,
    valoracio ENUM('like', 'dislike'),
    usuari_id INT NOT NULL,
    video_id INT NOT NULL,
    PRIMARY KEY(comentari_id),
    FOREIGN KEY(usuari_id) REFERENCES usuari(usuari_id),
    FOREIGN KEY(video_id) REFERENCES videos(video_id)
);
CREATE TABLE like_dislike_comentari (
    like_dislike_comentari_id INT NOT NULL AUTO_INCREMENT,
    data DATE NOT NULL,
    like_dislike ENUM('like', 'dislike'),
    usuari_id INT NOT NULL,
    comentari_id INT NOT NULL,
    PRIMARY KEY(like_dislike_comentari_id),
    FOREIGN KEY(usuari_id) REFERENCES usuari(usuari_id),
    FOREIGN KEY(comentari_id) REFERENCES comentari(comentari_id)
);
CREATE TABLE like_dislike_video (
    like_dislike_video_id INT NOT NULL AUTO_INCREMENT,
    data DATE NOT NULL,
    like_dislike ENUM('like', 'dislike'),
    usuari_id INT NOT NULL,
    video_id INT NOT NULL,
    PRIMARY KEY(like_dislike_video_id),
    FOREIGN KEY(usuari_id) REFERENCES usuari(usuari_id),
    FOREIGN KEY(video_id) REFERENCES videos(video_id)
);
CREATE TABLE canal (
    canal_id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    descripcio VARCHAR(255) NOT NULL,
    data_creacio DATE NOT NULL,
    usuari_id INT NOT NULL,
    PRIMARY KEY(canal_id),
    FOREIGN KEY(usuari_id) REFERENCES usuari(usuari_id)
);
CREATE suscripcio (
    suscripcio_id INT NOT NULL AUTO_INCREMENT,
    canal_id INT NOT NULL,
    PRIMARY KEY(suscripcio_id),
    FOREIGN KEY(canal_id) REFERENCES canal(canal_id)
);
CREATE playlist (
    playlist_id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    data_creacio DATE NOT NULL,
    estat ENUM('public', 'privat') NOT NULL,
    usuari_id INT NOT NULL,
    PRIMARY KEY(playlist_id),
    FOREIGN KEY(usuari_id) REFERENCES usuari(usuari_id)
);
