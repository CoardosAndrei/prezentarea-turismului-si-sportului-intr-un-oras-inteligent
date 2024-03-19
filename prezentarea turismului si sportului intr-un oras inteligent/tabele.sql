create database if not exists paginaWEB;
use paginaWEB;

CREATE TABLE IF NOT EXISTS dateUser (			-- ghid_turistic/restaurant/hotel/proprTeren
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    tip VARCHAR(50) NOT NULL,
    numeCont VARCHAR(50) NOT NULL,
    nume VARCHAR(50),
    prenume VARCHAR(50),
    email VARCHAR(100) UNIQUE NOT NULL,
    nr_tel VARCHAR(15) NOT NULL,
	parola_hash VARCHAR(255) NOT NULL
);
CREATE TABLE IF NOT EXISTS dateClient (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    nume VARCHAR(50) NOT NULL,
    prenume VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    nr_tel VARCHAR(15) NOT NULL
);
CREATE TABLE IF NOT EXISTS rezervariGhid (
    rezervare_id INT AUTO_INCREMENT PRIMARY KEY,
    idGhid INT,
    idUser INT,
    data DATE,
    traseu VARCHAR(255),
    ended BOOLEAN,
    FOREIGN KEY (idGhid) REFERENCES dateUser(user_id),
    FOREIGN KEY (idUser) REFERENCES dateClient(user_id)
);
CREATE TABLE IF NOT EXISTS serviciuGhid (
    serviciu_id INT AUTO_INCREMENT PRIMARY KEY,
    idGhid INT,
    titlu VARCHAR(100),
    descriere VARCHAR(255),
    pret DECIMAL(10, 2),
    FOREIGN KEY (idGhid) REFERENCES dateUser(user_id)
);
CREATE TABLE IF NOT EXISTS traseeGhid (
    traseu_id INT AUTO_INCREMENT PRIMARY KEY,
    idGhid INT,
    titlu VARCHAR(100),
    descriere VARCHAR(255),
    pret DECIMAL(10, 2),
    FOREIGN KEY (idGhid) REFERENCES dateUser(user_id)
);
CREATE TABLE IF NOT EXISTS rezervariRest (
    rezervare_id INT AUTO_INCREMENT PRIMARY KEY,
    idRest INT,
    idUser INT,
    data DATE,
    masa INT,
    ended BOOLEAN,
    FOREIGN KEY (idRest) REFERENCES dateUser(user_id),
    FOREIGN KEY (idUser) REFERENCES dateClient(user_id)
);
CREATE TABLE IF NOT EXISTS oreFunctionareRestaurant (
    ore_id INT AUTO_INCREMENT PRIMARY KEY,
    idRest INT,
    deschidere TIME,
    inchidere TIME,
    deschis BOOLEAN,
    FOREIGN KEY (idRest) REFERENCES dateUser(user_id)
);
CREATE TABLE IF NOT EXISTS rezervareCamera (
    rezervare_id INT AUTO_INCREMENT PRIMARY KEY,
    idHotel INT,
    idUser INT,
    dataStart DATE,
    dataEnd DATE,
    ended BOOLEAN,
    FOREIGN KEY (idHotel) REFERENCES dateUser(user_id),
    FOREIGN KEY (idUser) REFERENCES dateClient(user_id)
);
CREATE TABLE IF NOT EXISTS rezervareParcare (
    rezervare_id INT AUTO_INCREMENT PRIMARY KEY,
    idHotel INT,
    idUser INT,
    dataStart DATE,
    dataEnd DATE,
    ended BOOLEAN,
    FOREIGN KEY (idHotel) REFERENCES dateUser(user_id),
    FOREIGN KEY (idUser) REFERENCES dateClient(user_id)
);
CREATE TABLE IF NOT EXISTS rezervariTeren (
    rezervare_id INT AUTO_INCREMENT PRIMARY KEY,
    idPropr INT,
    idUser INT,
    numeTeren VARCHAR(100),
    dataStart DATE,
    dataEnd DATE,
    ended BOOLEAN,
    FOREIGN KEY (idPropr) REFERENCES dateUser(user_id),
    FOREIGN KEY (idUser) REFERENCES dateClient(user_id)
);
CREATE TABLE IF NOT EXISTS terenSala (
    terenSala_id INT AUTO_INCREMENT PRIMARY KEY,
    idPropr INT,
    nume VARCHAR(100),
    descriere VARCHAR(255),
    locatie VARCHAR(100),
    pret FLOAT,
    FOREIGN KEY (idPropr) REFERENCES dateUser(user_id)
);
CREATE TABLE IF NOT EXISTS anunturi (
    anunt_id INT AUTO_INCREMENT PRIMARY KEY,
    titlu VARCHAR(100),
    descriere VARCHAR(255)
);
CREATE TABLE IF NOT EXISTS contact (
    contact_id INT AUTO_INCREMENT PRIMARY KEY,
    nume VARCHAR(100),
    numar_telefon VARCHAR(20),
    email VARCHAR(100) UNIQUE NOT NULL,
    functie VARCHAR(100) UNIQUE NOT NULL
);

