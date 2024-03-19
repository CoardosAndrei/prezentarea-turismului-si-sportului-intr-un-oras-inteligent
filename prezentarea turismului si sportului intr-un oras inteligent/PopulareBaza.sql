use paginaWEB;

INSERT INTO dateUser (numeCont, tip, email, nr_tel, parola_hash)
VALUES ('3stele', 'Hotel', 'hotel@email.com', '123456789', 'a665a45920422f9d417e4867efdc4fb8a04a1f3fff1fa07e998e86f7f7a27ae3'); -- parola 123

INSERT INTO dateUser (numeCont, tip, email, nr_tel, parola_hash)
VALUES ('restaurant1', 'Restaurant', 'restaurant1@email.com', '123456789', '9af15b336e6a9619928537df30b2e6a2376569fcf9d7e773eccede65606529a0'); -- parola 0000

INSERT INTO dateUser (numeCont, tip, nume, prenume, email, nr_tel, parola_hash)
VALUES ('ghid1', 'GhidTuristic', 'Coardos', 'Andrei', 'ghid1@email.com', '123456789', 'a3a2754f94b4f8c1ca8d29290bc37ba90cedf0e13a9e702a829740835e5ed564'); -- parola parola123

INSERT INTO dateUser (numeCont, tip, email, nr_tel, parola_hash)
VALUES ('proprietar1', 'ProprTeren', 'proprietar1@email.com', '123456789', '31cb259bb118620e1052918118a0b37e59f89ad03457d94ffb48480daf53a432'); -- parola dqwhdiuk1243eqwFSA

-- Inserare în tabela contact
INSERT INTO contact (nume, numar_telefon, email, functie) VALUES ('John Doe', '123456789', 'john.doe@example.com', 'Manager');
INSERT INTO contact (nume, numar_telefon, email, functie) VALUES ('Jane Smith', '987654321', 'jane.smith@example.com', 'Programator');
INSERT INTO contact (nume, numar_telefon, email, functie) VALUES ('Alice Johnson', '555555555', 'alice.johnson@example.com', 'Designer');
