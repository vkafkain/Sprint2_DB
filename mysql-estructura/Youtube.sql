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
    durada TIME NOT NULL,
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
    video_id INT NOT NULL,
    PRIMARY KEY(etiqueta_id),
    FOREIGN KEY(video_id) REFERENCES videos(video_id)
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
CREATE TABLE suscripcio (
    suscripcio_id INT NOT NULL AUTO_INCREMENT,
    canal_id INT NOT NULL,
    PRIMARY KEY(suscripcio_id),
    FOREIGN KEY(canal_id) REFERENCES canal(canal_id)
);
CREATE TABLE playlist (
    playlist_id INT NOT NULL AUTO_INCREMENT,
    nom VARCHAR(255) NOT NULL,
    data_creacio DATE NOT NULL,
    estat ENUM('public', 'privat') NOT NULL,
    usuari_id INT NOT NULL,
    PRIMARY KEY(playlist_id),
    FOREIGN KEY(usuari_id) REFERENCES usuari(usuari_id)
);
-- INSERT DATA TO DATABASE
INSERT INTO usuari (email, contrasenya, nom, data_naixement, sexe, pais, codi_postal)
VALUES ('antoni@hotmail.com', 'antoni1234', 'antoni_plays', '2001-02-12', 'home', 'espanya', 08004),
('rosa13@hotmail.com', 'rosa04492', 'rosita', '1976-09-23', 'dona', 'mexic', 12311),
('marga@hotmail.com', 'margaconsejos1234', 'marga_consejos', '1998-12-09', 'dona', 'ecuador', 976345),
('joan@hotmail.com', 'joanpass3419', 'joanet', '1982-10-11', 'home', 'espanya', 13421);
INSERT INTO videos (titol, descripcio, tamany_arxiu, nom_arxiu, durada, thumnail, nombre_reproduccions, estat, usuari_id)
VALUES ('Viatge Africa','El nostre primer viatge amb familia..', '3GB','viatge', '00:12:34', './viatge_a_africa', 12, 'privat', 1),
('VLOG 32','vlog sobre comportaments..', '7.8GB', 'vlog12', '01:00:22', './vlog', 5, 'public', 2),
('Mi diario','El diario de mi dia a dia', '6.5GB', 'diario', '00:38:04', './mi_diario', 29, 'public', 3),
('Les tres besones old','Capitol més vist de les 3 besones', '9.9GB', 'besones', '00:34:09', './tres_besones', 12734, 'public', 4);
INSERT INTO etiquetes (nom, video_id) VALUES('animals', 1), ('viatges', 2), ('records', 3), ('serie', 4);
INSERT INTO comentari (text_comentari, data, hora, valoracio, usuari_id, video_id)
VALUES ('Lorem ipsum dolor sit amet', '2021-09-21', '03:23:01','like', 1, 1),
('Id quas delectus aut recusandae voluptas', '2020-09-21', '12:03:11','like', 2, 2),
('Ut doloremque aperiam ut ipsum dolorum ut placeat', '2021-12-01', '14:23:51','dislike', 3, 3),
('Sunt et officiis quidem in laboriosam enim.', '2022-01-01', '18:55:50','dislike', 4, 4);
INSERT INTO like_dislike_comentari (data, like_dislike, usuari_id, comentari_id)
VALUES ('2021-09-21', 'like', 1, 1), ('2020-09-21', 'like', 2, 2), ('2021-12-01', 'dislike', 3, 3), ('2022-01-01', 'dislike', 4, 4);
INSERT INTO like_dislike_video (data, like_dislike, usuari_id, video_id)
VALUES ('2020-07-22', 'like', 1, 1), ('2021-10-20', 'like', 2, 2), ('2019-08-06', 'dislike', 3, 3), ('2020-02-20', 'dislike', 4, 4);
INSERT INTO canal (nom, descripcio, data_creacio, usuari_id)
VALUES ('FamiconGames', 'Canal dedicat a videos jocs', '2021-04-19', 1),
('CanalJordi', 'El meu canal personal', '2019-10-11', 2),
('Revolution', 'Animals, paisatges i més', '2020-05-08', 3),
('ReproOld', 'Series antigues', '2020-11-29', 4);
INSERT INTO suscripcio (suscripcio_id, canal_id)
VALUES (1,1), (2,2), (3,3), (4,4);
INSERT INTO playlist (nom, data_creacio, estat, usuari_id)
VALUES ('Playlist1', '2021-12-03', 'public', 1),
('Recorts', '2022-01-03', 'public', 2),
('La meva Playlist', '2019-04-12', 'public', 3),
('Besones03', '2018-02-12', 'public', 4);
