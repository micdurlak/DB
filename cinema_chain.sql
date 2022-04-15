CREATE DATABASE cinema_chain;

CREATE TABLE kina (
	id SERIAL PRIMARY KEY,
	nazwa_kina varchar(30) NOT NULL,
	miejscowosc varchar(60) NOT NULL,
	ulica varchar(100),
	kod_pocztowy char(6) NOT NULL,
	data_otwarcia DATE NOT NULL,
	data_zamkniecia DATE
);

CREATE TABLE filmy(
	id SERIAL PRIMARY KEY,
	tytul_filmu varchar(300) NOT NULL,
	czas_trwania int NOT NULL, 
	rok_produkcji int,
	opis_filmu text,
	obsada text,
	wersja_jezykowa char(2), 
	napisy_pl boolean DEFAULT true, 
	jakosc_filmu varchar(10), 
	gatunek varchar(50),
	ograniczenia_wiekowe varchar(5), 
	koszt_licencji numeric(10, 2), 
	dostepny_od DATE NOT NULL,
	dostepny_do DATE NOT NULL	
);

CREATE TABLE klienci (
	id serial PRIMARY KEY,
	login varchar(50) NOT NULL,
	email varchar(100) NOT NULL,
	data_utworzenia DATE NOT NULL DEFAULT NOW(), 
	imie varchar(40),
	nazwisko varchar(40)
);

CREATE TABLE sale_kinowe(
	id serial PRIMARY KEY,
	nazwa_sali varchar(50) NOT NULL,
	pietro varchar(5),
	ilosc_miejsc int NOT NULL,
	jakosc_ekranu varchar(10),
	id_kina int REFERENCES kina(id) 
);

CREATE TABLE sale_kinowe_miejsca(
	id serial PRIMARY KEY,
	numer_miejsca varchar(4) NOT NULL, 
	rzad varchar(4) NOT NULL,
	id_sali int NOT NULL,
	CONSTRAINT id_sali_fkey FOREIGN KEY (id_sali)
		REFERENCES sale_kinowe(id) 
);

CREATE TABLE public.seanse(
	id serial PRIMARY KEY,
	id_filmu int NOT NULL REFERENCES filmy(id),
	id_sali int NOT NULL  REFERENCES sale_kinowe(id),
	data_seansu date NOT NULL,
	godzina_seansu time NOT NULL,
	cena_biletu_normalnego numeric(5,2) NOT NULL,
	cena_biletu_ulgowego numeric(5,2) NOT NULL
);

CREATE TABLE rezerwacje(
	id serial PRIMARY KEY,
	id_seansu int NOT NULL REFERENCES seanse(id),
	id_miejca int NOT NULL REFERENCES sale_kinowe_miejsca(id),
	czy_oplacona boolean DEFAULT false,
	data_zakupu date,
	godzina_zakupu time,
	miejsce_zakupu varchar(20) NOT NULL,
	id_klienta int REFERENCES klienci(id)
);

INSERT INTO kina(nazwa_kina, miejscowosc, ulica, kod_pocztowy, data_otwarcia, data_zamkniecia)
VALUES('Merkury', 'Kraków', 'Staffa 12', '39-100', '2018-04-30', NULL);
INSERT INTO kina(nazwa_kina, miejscowosc, ulica, kod_pocztowy, data_otwarcia, data_zamkniecia)
VALUES('Wenus', 'Białystok', 'Pabianicka 33', '67-200', '2015-04-30', '2020-03-30');
INSERT INTO kina(nazwa_kina, miejscowosc, ulica, kod_pocztowy, data_otwarcia, data_zamkniecia)
VALUES('Ziemia', 'Rzeszów', 'Wojska Polskiego 1', '43-100', '2021-01-02', NULL);
INSERT INTO kina(nazwa_kina, miejscowosc, ulica, kod_pocztowy, data_otwarcia, data_zamkniecia)
VALUES('Jowisz', 'Gdańsk', 'Morska 200', '88-200', '2019-04-12', '2019-10-20');
INSERT INTO kina(nazwa_kina, miejscowosc, ulica, kod_pocztowy, data_otwarcia, data_zamkniecia)
VALUES('Saturn', 'Gdańsk', 'Niebieska 20', '88-100', '2010-02-28', NULL);
INSERT INTO kina(nazwa_kina, miejscowosc, ulica, kod_pocztowy, data_otwarcia, data_zamkniecia)
VALUES('Uran', 'Sopot', 'Jagiellońska 22', '87-123', '1999-04-30', NULL);
INSERT INTO kina(nazwa_kina, miejscowosc, ulica, kod_pocztowy, data_otwarcia, data_zamkniecia)
VALUES('Neptun', 'Warszawa', 'Aleje Jerozolimskie 11', '00-111', '2021-06-30', NULL);

INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Merkury','1',40,'4K',1);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Wenus','1',66,'8K',1);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Ziemia','1',23,'4K',1);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Mars','2',52,'3D',1);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Jowisz','2',27,'4K',1);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Saturn','3',47,'4K',1);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Uran','3',79,'4K',1);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Neptun','3',63,'8K',1);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Pluton','3',80,'4K',1);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Merkury','1',36,'3D',2);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Wenus','1',48,'4K',2);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Ziemia','1',42,'4K',2);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Mars','2',56,'4K',2);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Jowisz','2',46,'8K',2);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Saturn','3',33,'4K',2);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Uran','3',28,'3D',2);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Neptun','3',76,'4K',2);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Pluton','3',27,'4K',2);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Merkury','1',44,'4K',3);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Wenus','1',53,'8K',3);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Ziemia','1',22,'4K',3);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Mars','2',38,'3D',3);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Jowisz','2',27,'4K',3);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Saturn','3',21,'4K',3);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Uran','3',69,'4K',3);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Neptun','3',75,'8K',3);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Pluton','3',64,'4K',3);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Merkury','1',74,'3D',4);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Wenus','1',59,'4K',4);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Ziemia','1',42,'4K',4);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Mars','2',41,'4K',4);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Jowisz','2',37,'8K',4);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Saturn','3',21,'4K',4);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Uran','3',27,'3D',4);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Neptun','3',66,'4K',4);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Pluton','3',30,'4K',4);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Merkury','1',46,'4K',5);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Wenus','1',48,'4K',5);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Ziemia','1',30,'4K',5);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Mars','2',47,'4K',5);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Jowisz','2',44,'4K',5);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Saturn','3',36,'8K',5);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Uran','3',32,'4K',5);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Neptun','3',26,'3D',5);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Pluton','3',26,'4K',5);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Merkury','1',58,'4K',6);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Wenus','1',56,'4K',6);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Ziemia','1',78,'4K',6);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Mars','2',58,'4K',6);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Jowisz','2',77,'8K',6);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Saturn','3',68,'4K',6);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Uran','3',55,'3D',6);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Neptun','3',49,'4K',6);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Pluton','3',37,'4K',6);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Merkury','1',26,'4K',7);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Wenus','1',38,'8K',7);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Ziemia','1',42,'4K',7);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Mars','2',26,'3D',7);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Jowisz','2',27,'4K',7);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Saturn','3',45,'4K',7);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Uran','3',66,'4K',7);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Neptun','3',59,'4K',7);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Pluton','3',80,'4K',7);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Merkury','1',67,'4K',8);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Wenus','1',48,'8K',8);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Ziemia','1',80,'4K',8);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Mars','2',72,'3D',8);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Jowisz','2',34,'4K',8);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Saturn','3',64,'4K',8);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Uran','3',28,'4K',8);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Neptun','3',66,'4K',8);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Pluton','3',24,'4K',8);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Merkury','1',71,'4K',9);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Wenus','1',31,'8K',9);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Ziemia','1',47,'4K',9);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Mars','2',74,'3D',9);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Jowisz','2',54,'4K',9);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Saturn','3',28,'4K',9);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Uran','3',36,'4K',9);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Neptun','3',74,'4K',9);
INSERT INTO sale_kinowe (nazwa_sali, pietro, ilosc_miejsc, jakosc_ekranu, id_kina) VALUES ('Pluton','3',38,'4K',9);

INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('1','1',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('2','1',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('3','1',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('4','1',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('5','1',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('6','1',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('7','1',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('8','1',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('9','1',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('10','1',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('11','2',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('12','2',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('13','2',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('14','2',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('15','2',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('16','2',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('17','2',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('18','2',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('19','2',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('20','2',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('21','3',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('22','3',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('23','3',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('24','3',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('25','3',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('26','3',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('27','3',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('28','3',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('29','3',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('30','3',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('31','4',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('32','4',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('33','4',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('34','4',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('35','4',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('36','4',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('37','4',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('38','4',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('39','4',1);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('40','4',1);

INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('1','1',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('2','1',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('3','1',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('4','1',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('5','1',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('6','1',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('7','1',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('8','1',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('9','1',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('10','2',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('11','2',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('12','2',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('13','2',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('14','2',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('15','2',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('16','2',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('17','2',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('18','2',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('19','2',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('20','3',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('21','3',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('22','3',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('23','3',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('24','3',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('25','3',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('26','3',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('27','3',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('28','3',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('29','3',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('30','4',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('31','4',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('32','4',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('33','4',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('34','4',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('35','4',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('36','4',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('37','4',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('38','4',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('39','4',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('40','5',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('41','5',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('42','5',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('43','5',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('44','5',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('45','5',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('46','5',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('47','5',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('48','5',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('49','5',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('50','6',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('51','6',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('52','6',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('53','6',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('54','6',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('55','6',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('56','6',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('57','6',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('58','6',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('59','6',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('60','7',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('61','7',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('62','7',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('63','7',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('64','7',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('65','7',2);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('66','7',2);

INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('1','1',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('2','1',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('3','1',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('4','1',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('5','1',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('6','1',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('7','1',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('8','1',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('9','1',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('10','2',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('11','2',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('12','2',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('13','2',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('14','2',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('15','2',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('16','2',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('17','2',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('18','2',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('19','2',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('20','3',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('21','3',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('22','3',3);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('23','3',3);

INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('1','1',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('2','1',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('3','1',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('4','1',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('5','1',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('6','1',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('7','1',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('8','1',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('9','1',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('10','2',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('11','2',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('12','2',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('13','2',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('14','2',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('15','2',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('16','2',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('17','2',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('18','2',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('19','2',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('20','3',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('21','3',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('22','3',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('23','3',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('24','3',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('25','3',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('26','3',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('27','3',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('28','3',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('29','3',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('30','4',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('31','4',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('32','4',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('33','4',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('34','4',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('35','4',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('36','4',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('37','4',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('38','4',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('39','4',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('40','5',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('41','5',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('42','5',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('43','5',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('44','5',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('45','5',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('46','5',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('47','5',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('48','5',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('49','5',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('50','6',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('51','6',4);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('52','6',4);

INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('1','1',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('2','1',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('3','1',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('4','1',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('5','1',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('6','1',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('7','1',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('8','1',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('9','1',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('10','2',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('11','2',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('12','2',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('13','2',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('14','2',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('15','2',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('16','2',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('17','2',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('18','2',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('19','2',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('20','3',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('21','3',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('22','3',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('23','3',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('24','3',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('25','3',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('26','3',5);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('27','3',5);

INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('1','1',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('2','1',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('3','1',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('4','1',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('5','1',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('6','1',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('7','1',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('8','1',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('9','1',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('10','2',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('11','2',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('12','2',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('13','2',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('14','2',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('15','2',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('16','2',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('17','2',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('18','2',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('19','2',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('20','3',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('21','3',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('22','3',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('23','3',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('24','3',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('25','3',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('26','3',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('27','3',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('28','3',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('29','3',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('30','4',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('31','4',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('32','4',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('33','4',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('34','4',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('35','4',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('36','4',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('37','4',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('38','4',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('39','4',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('40','5',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('41','5',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('42','5',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('43','5',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('44','5',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('45','5',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('46','5',6);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('47','5',6);

INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('1','1',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('2','1',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('3','1',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('4','1',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('5','1',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('6','1',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('7','1',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('8','1',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('9','1',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('10','2',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('11','2',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('12','2',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('13','2',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('14','2',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('15','2',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('16','2',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('17','2',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('18','2',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('19','2',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('20','3',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('21','3',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('22','3',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('23','3',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('24','3',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('25','3',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('26','3',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('27','3',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('28','3',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('29','3',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('30','4',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('31','4',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('32','4',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('33','4',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('34','4',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('35','4',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('36','4',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('37','4',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('38','4',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('39','4',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('40','5',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('41','5',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('42','5',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('43','5',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('44','5',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('45','5',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('46','5',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('47','5',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('48','5',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('49','5',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('50','6',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('51','6',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('52','6',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('53','6',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('54','6',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('55','6',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('56','6',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('57','6',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('58','6',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('59','6',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('60','7',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('61','7',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('62','7',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('63','7',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('64','7',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('65','7',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('66','7',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('67','7',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('68','7',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('69','7',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('70','8',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('71','8',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('72','8',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('73','8',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('74','8',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('75','8',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('76','8',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('77','8',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('78','8',7);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('79','8',7);

INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('1','1',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('2','1',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('3','1',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('4','1',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('5','1',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('6','1',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('7','1',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('8','1',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('9','1',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('10','2',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('11','2',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('12','2',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('13','2',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('14','2',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('15','2',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('16','2',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('17','2',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('18','2',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('19','2',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('20','3',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('21','3',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('22','3',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('23','3',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('24','3',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('25','3',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('26','3',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('27','3',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('28','3',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('29','3',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('30','4',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('31','4',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('32','4',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('33','4',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('34','4',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('35','4',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('36','4',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('37','4',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('38','4',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('39','4',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('40','5',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('41','5',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('42','5',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('43','5',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('44','5',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('45','5',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('46','5',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('47','5',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('48','5',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('49','5',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('50','6',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('51','6',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('52','6',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('53','6',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('54','6',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('55','6',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('56','6',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('57','6',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('58','6',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('59','6',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('60','7',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('61','7',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('62','7',8);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('63','7',8);

INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('1','1',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('2','1',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('3','1',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('4','1',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('5','1',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('6','1',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('7','1',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('8','1',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('9','1',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('10','2',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('11','2',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('12','2',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('13','2',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('14','2',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('15','2',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('16','2',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('17','2',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('18','2',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('19','2',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('20','3',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('21','3',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('22','3',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('23','3',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('24','3',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('25','3',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('26','3',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('27','3',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('28','3',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('29','3',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('30','4',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('31','4',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('32','4',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('33','4',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('34','4',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('35','4',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('36','4',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('37','4',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('38','4',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('39','4',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('40','5',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('41','5',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('42','5',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('43','5',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('44','5',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('45','5',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('46','5',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('47','5',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('48','5',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('49','5',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('50','6',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('51','6',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('52','6',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('53','6',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('54','6',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('55','6',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('56','6',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('57','6',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('58','6',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('59','6',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('60','7',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('61','7',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('62','7',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('63','7',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('64','7',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('65','7',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('66','7',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('67','7',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('68','7',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('69','7',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('70','8',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('71','8',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('72','8',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('73','8',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('74','8',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('75','8',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('76','8',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('77','8',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('78','8',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('79','8',9);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('80','9',9);

INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('1','1',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('2','1',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('3','1',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('4','1',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('5','1',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('6','1',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('7','1',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('8','1',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('9','1',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('10','2',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('11','2',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('12','2',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('13','2',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('14','2',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('15','2',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('16','2',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('17','2',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('18','2',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('19','2',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('20','3',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('21','3',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('22','3',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('23','3',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('24','3',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('25','3',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('26','3',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('27','3',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('28','3',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('29','3',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('30','4',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('31','4',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('32','4',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('33','4',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('34','4',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('35','4',10);
INSERT INTO sale_kinowe_miejsca (numer_miejsca, rzad, id_sali) VALUES ('36','4',10);

INSERT INTO filmy(tytul_filmu, czas_trwania, rok_produkcji, opis_filmu, obsada, wersja_jezykowa, jakosc_filmu, gatunek, ograniczenia_wiekowe, koszt_licencji, dostepny_od, dostepny_do)
 VALUES ('Jak rozpętałem II wojnę światową', 72, '1970', 'Franek Dolas trafia jako przymusowy ochotnik do Legii Cudzoziemskiej. Przez pomyłkę dostaje funkcję kucharza. Ogrywa Arabów w grę w trzy karty i zdobywa w ten sposób świeżą żywność.', 'Marian Kociniak, Wacław Kowalski, Jan Świderski', 'PL', '4K', 'KOMEDIA', '7+', '30000', '2021-06-01', '2022-06-01');
INSERT INTO filmy(tytul_filmu, czas_trwania, rok_produkcji, opis_filmu, obsada, wersja_jezykowa, jakosc_filmu, gatunek, ograniczenia_wiekowe, koszt_licencji, dostepny_od, dostepny_do)
 VALUES ('Infiltracja', 151, '2006', 'Agent Costigan musi wejść w mafijne struktury, którymi dowodzi Frank Costello. W czasie gdy stara się on pozyskać zaufanie bossa, do policji podstępem dostaje się przestępca, Sullivan.', 'Leonardo DiCaprio, Matt Damon, Jack Nicholson', 'EN', '8K', 'THRILLER', '12+', '50000', '2021-04-01', '2021-10-01');
INSERT INTO filmy(tytul_filmu, czas_trwania, rok_produkcji, opis_filmu, obsada, wersja_jezykowa, jakosc_filmu, gatunek, ograniczenia_wiekowe, koszt_licencji, dostepny_od, dostepny_do)
 VALUES ('Gladiator', 148, '2000', 'Cesarz Marek Aureliusz chce uczynić generała Maksimusa swoim następcą. Nie podoba się to prawowitemu dziedzicowi Kommodusowi, który postanawia pozbyć się rywala. Maksimus trafia do niewoli.', 'Russell Crowe, Joaquin Phoenix, Connie Nielsen', 'EN', '8K', 'DRAMAT', '16+', '50000', '2021-03-10', '2022-02-01');
INSERT INTO filmy(tytul_filmu, czas_trwania, rok_produkcji, opis_filmu, obsada, wersja_jezykowa, jakosc_filmu, gatunek, ograniczenia_wiekowe, koszt_licencji, dostepny_od, dostepny_do)
 VALUES ('Podziemny krąg', 133, '1999', 'Jack jest młodym biznesmenem. Praca i samotnie spędzane wieczory wypełniają jego życie. Pewnego dnia podczas podróży samolotem poznaje tajemniczego Tylera i postanawia założyć wraz z nim tajny klub.', 'Edward Norton, Brad Pitt', 'EN', '4K', 'DRAMAT', '12+', '30000', '2021-06-01', '2023-01-01');
INSERT INTO filmy(tytul_filmu, czas_trwania, rok_produkcji, opis_filmu, obsada, wersja_jezykowa, jakosc_filmu, gatunek, ograniczenia_wiekowe, koszt_licencji, dostepny_od, dostepny_do)
 VALUES ('Zielona mila', 200, '1999', 'Paul Edgecomb ogląda w telewizji przedwojenny film. Obraz przywołuje odległe wspomnienia, z których Paul zwierza się przyjaciółce. W 1935 r. mężczyzna pracował w jednym z więzień na południu USA.', 'Tom Hanks, David Morse, James Cromwell', 'EN', '8K', 'DRAMAT', '12+', '25000', '2021-03-01', '2023-03-01');
INSERT INTO filmy(tytul_filmu, czas_trwania, rok_produkcji, opis_filmu, obsada, wersja_jezykowa, jakosc_filmu, gatunek, ograniczenia_wiekowe, koszt_licencji, dostepny_od, dostepny_do)
 VALUES ('Wielki Szu', 96, '1983', 'Wielki Szu to pojedynek między mistrzem i uczniem, wielkim karciarzem zmęczonym życiem a młodzikiem nim zafascynowanym, głodnym sukcesu i pieniędzy, trawionym gorączką rodzącego się nałogu.', 'Jan Nowicki, Andrzej Pieczyński, Leon Niemczyk', 'PL', '4K', 'SENSACYJNY', '12+', '10000', '2021-02-01', '2021-11-30');
INSERT INTO filmy(tytul_filmu, czas_trwania, rok_produkcji, opis_filmu, obsada, wersja_jezykowa, jakosc_filmu, gatunek, ograniczenia_wiekowe, koszt_licencji, dostepny_od, dostepny_do)
 VALUES ('Szeregowiec Ryan', 169, '1998', '6 czerwca 1944 r., alianci lądują w Normandii. Kapitan John Miller ma stworzyć specjalny oddział, którego zadaniem jest odnaleźć i sprowadzić ostatniego z czwórki braci Ryanów, który przeżył desant.', 'Tom Hanks, Tom Sizemore, Ed Burns', 'EN', '8K', 'WOJENNY', '12+', '14500', '2021-03-01', '2022-01-01');
INSERT INTO filmy(tytul_filmu, czas_trwania, rok_produkcji, opis_filmu, obsada, wersja_jezykowa, jakosc_filmu, gatunek, ograniczenia_wiekowe, koszt_licencji, dostepny_od, dostepny_do)
 VALUES ('Przełęcz ocalonych', 139, '2016', 'Schyłek II wojny światowej. Armia amerykańska toczy walki z Japończykami. Strategicznym celem jest wyspa Okinawa, gdzie trafia oskarżany o tchórzostwo sanitariusz.', 'Andrew Garfield, Sam Worthington', 'EN', '8K', 'WOJENNY', '16+', '12083', '2021-01-01', '2023-12-31');
INSERT INTO filmy(tytul_filmu, czas_trwania, rok_produkcji, opis_filmu, obsada, wersja_jezykowa, jakosc_filmu, gatunek, ograniczenia_wiekowe, koszt_licencji, dostepny_od, dostepny_do)
 VALUES ('Szklana pułapka', 132, '1988', 'Grupa terrorystów, która opanowała wieżowiec w Los Angeles, nie przewidziała, że w labiryncie pięter i korytarzy ukrył się policjant John McClane. Rozpoczyna się bezwzględny pojedynek.', 'Bruce Willis, Bonnie Bedelia, Alan Rickman', 'EN', '8K', 'AKCJI', '12+', '10353', '2021-03-10', '2022-02-01');
INSERT INTO filmy(tytul_filmu, czas_trwania, rok_produkcji, opis_filmu, obsada, wersja_jezykowa, jakosc_filmu, gatunek, ograniczenia_wiekowe, koszt_licencji, dostepny_od, dostepny_do)
 VALUES ('Forrest Gump', 142, '1994', 'Na tle powojennych losów Stanów Zjednoczonych ukazana jest historia życiowego nieudacznika, Forresta Gumpa, który mimo to, albo właśnie dlatego, staje się bohaterem narodowym.', 'Tom Hanks, Sally Field, Robin Wright', 'EN', '4K', 'KOMEDIA', '16+', '9068', '2021-06-01', '2023-01-01');
INSERT INTO filmy(tytul_filmu, czas_trwania, rok_produkcji, opis_filmu, obsada, wersja_jezykowa, jakosc_filmu, gatunek, ograniczenia_wiekowe, koszt_licencji, dostepny_od, dostepny_do)
 VALUES ('Powrót do przyszłości', 106, '1985', 'Marty McFly przypadkowo przenosi się w lata 50. XX wieku, gdzie próbuje pogodzić swoich przyszłych rodziców. W przeciwnym razie nigdy się nie narodzi.', 'Michael J. Fox, Christopher Lloyd', 'EN', '3D', 'SCIENCE-FICTION', '7+', '11060', '2021-03-01', '2023-03-01');
INSERT INTO filmy(tytul_filmu, czas_trwania, rok_produkcji, opis_filmu, obsada, wersja_jezykowa, jakosc_filmu, gatunek, ograniczenia_wiekowe, koszt_licencji, dostepny_od, dostepny_do)
 VALUES ('Chłopcy z ferajny', 146, '1990', 'Opowieść o losach Henryego Hilla, który rozpoczął gangsterską karierę jako nastolatek i osiągnął szczyt w hierarchii mafijnej, a zakończył ją jako świadek oskarżenia w procesie bossów.', 'Robert De Niro, Ray Liotta, Joe Pesci', 'EN', '4K', 'SENSACYJNY', '12+', '9861', '2021-02-01', '2021-11-30');
INSERT INTO filmy(tytul_filmu, czas_trwania, rok_produkcji, opis_filmu, obsada, wersja_jezykowa, jakosc_filmu, gatunek, ograniczenia_wiekowe, koszt_licencji, dostepny_od, dostepny_do)
 VALUES ('Sami swoi', 80, '1967', 'Opowieść o perypetiach dwóch zwaśnionych rodzin, przesiedleńców zza Buga. Jak niegdyś, mieszkają obok siebie, bo jak sami twierdzą - po co szukać obcego wroga, kiedy swój jest pod ręką.', 'Wacław Kowalski, Władysław Hańcza', 'PL', '4K', 'KOMEDIA', '7+', '21480', '2021-03-01', '2022-01-01');
INSERT INTO filmy(tytul_filmu, czas_trwania, rok_produkcji, opis_filmu, obsada, wersja_jezykowa, jakosc_filmu, gatunek, ograniczenia_wiekowe, koszt_licencji, dostepny_od, dostepny_do)
 VALUES ('Déjà vu', 126, '2006', 'Agent federalny Doug Carlin, obdarzony ponadprzeciętną intuicją, cofa się w czasie, aby pokrzyżować szyki terroryście i zapobiec tragedii.', 'Denzel Washington, Paula Patton, Val Kilmer', 'EN', '8K', 'THRILLER', '12+', '8534', '2021-03-01', '2023-03-01');
INSERT INTO filmy(tytul_filmu, czas_trwania, rok_produkcji, opis_filmu, obsada, wersja_jezykowa, jakosc_filmu, gatunek, ograniczenia_wiekowe, koszt_licencji, dostepny_od, dostepny_do)
 VALUES ('Dawno temu w Ameryce', 116, '1984', 'David i Max kierują grupą przestępczą, robią wielkie pieniądze na nielegalnym handlu alkoholem. Wraz z końcem prohibicji w 1933 r. gang przeżywa kryzys finansowy. Zgrana grupa powoli się rozpada.', 'Robert De Niro, James Woods, Larry Rapp', 'EN', '4K', 'DRAMAT', '16+', '14315', '2021-02-01', '2021-11-30');

INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (1, 1, '2021-08-01', '10:00', 24, 18);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (1, 11, '2021-08-01', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (1, 19, '2021-08-01', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (1, 28, '2021-08-01', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (1, 37, '2021-08-01', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (1, 46, '2021-08-01', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (1, 55, '2021-08-01', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (1, 64, '2021-08-01', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (1, 73, '2021-08-01', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (2, 2, '2021-08-01', '10:00', 24, 18);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (2, 19, '2021-08-01', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (2, 18, '2021-08-01', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (2, 27, '2021-08-01', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (2, 36, '2021-08-01', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (2, 45, '2021-08-01', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (2, 54, '2021-08-01', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (2, 63, '2021-08-01', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (2, 72, '2021-08-01', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (3, 1, '2021-08-15', '10:00', 24, 18);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (3, 11, '2021-08-15', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (3, 19, '2021-08-15', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (3, 28, '2021-08-15', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (3, 37, '2021-08-15', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (3, 46, '2021-08-15', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (3, 55, '2021-08-15', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (3, 64, '2021-08-15', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (3, 73, '2021-08-15', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (4, 1, '2021-08-05', '10:00', 24, 18);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (4, 11, '2021-08-05', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (4, 19, '2021-08-05', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (4, 28, '2021-08-05', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (4, 37, '2021-08-05', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (4, 46, '2021-08-05', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (4, 55, '2021-08-05', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (4, 64, '2021-08-05', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (4, 73, '2021-08-05', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (5, 1, '2021-08-07', '10:00', 24, 18);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (5, 11, '2021-08-07', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (5, 19, '2021-08-07', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (5, 28, '2021-08-07', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (5, 37, '2021-08-07', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (5, 46, '2021-08-07', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (5, 55, '2021-08-07', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (5, 64, '2021-08-07', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (5, 73, '2021-08-07', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (6, 1, '2021-08-06', '10:00', 24, 18);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (6, 11, '2021-08-06', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (6, 19, '2021-08-06', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (6, 28, '2021-08-06', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (6, 37, '2021-08-06', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (6, 46, '2021-08-06', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (6, 55, '2021-08-06', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (6, 64, '2021-08-06', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (6, 73, '2021-08-11', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (7, 1, '2021-08-02', '10:00', 24, 18);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (7, 11, '2021-08-02', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (7, 19, '2021-08-02', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (7, 28, '2021-08-02', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (7, 37, '2021-08-02', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (7, 46, '2021-08-02', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (7, 55, '2021-08-02', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (7, 64, '2021-08-02', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (7, 73, '2021-08-02', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (8, 3, '2021-08-02', '10:00', 24, 18);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (8, 15, '2021-08-05', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (8, 18, '2021-08-04', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (8, 23, '2021-08-03', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (8, 22, '2021-08-05', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (8, 43, '2021-08-04', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (8, 50, '2021-08-04', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (8, 60, '2021-08-03', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (8, 70, '2021-08-03', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (9, 4, '2021-08-02', '10:00', 24, 18);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (9, 14, '2021-08-02', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (9, 13, '2021-08-02', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (9, 23, '2021-08-02', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (9, 39, '2021-08-01', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (9, 48, '2021-08-01', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (9, 54, '2021-08-01', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (9, 65, '2021-08-01', '10:00', 24.00, 18.00);
INSERT INTO public.seanse(
	id_filmu, id_sali, data_seansu, godzina_seansu, cena_biletu_normalnego, cena_biletu_ulgowego)
	VALUES (9, 72, '2021-08-01', '10:00', 24.00, 18.00);


	




