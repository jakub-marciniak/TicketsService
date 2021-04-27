DROP DATABASE IF EXISTS serwis;
CREATE DATABASE IF NOT EXISTS serwis;

CREATE TABLE Roles (
id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
accessLevel INT UNSIGNED NOT NULL
);

CREATE TABLE Users (
id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
login VARCHAR(40) NOT NULL,
password VARCHAR(60) NOT NULL,
firstName VARCHAR(50) NOT NULL,
lastName VARCHAR(80) NOT NULL,
idRole INT UNSIGNED NOT NULL,
FOREIGN KEY (idRole) REFERENCES Roles (id)
);

CREATE TABLE States (
id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
name VARCHAR(20) NOT NULL
);

CREATE TABLE Tickets (
id INT UNSIGNED NOT NULL PRIMARY KEY AUTO_INCREMENT,
title VARCHAR(50) NOT NULL,
description TEXT NOT NULL,
dateStart DATETIME NOT NULL,
dateUpdate DATETIME NOT NULL,
idState INT UNSIGNED NOT NULL,
idUser INT UNSIGNED NOT NULL,
FOREIGN KEY (idUser) REFERENCES Users (id),
FOREIGN KEY (idState) REFERENCES States (id)
);

INSERT INTO Roles (name, accessLevel) VALUES ("Serwisant", 2);
INSERT INTO Roles (name, accessLevel) VALUES ("Klient", 1);

INSERT INTO States (name) VALUES ("Wysłane");
INSERT INTO States (name) VALUES ("Przyjęte");
INSERT INTO States (name) VALUES ("Zakończone");
