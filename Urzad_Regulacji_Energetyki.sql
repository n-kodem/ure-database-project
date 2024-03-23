CREATE TABLE `concession_withdrawn` (
  `id` int,
  `dkn` varchar(255),
  `nazwa` varchar(255),
  `poczta` varchar(255),
  `adres` varchar(255),
  `kod_pocztowy` varchar(10),
  `miejscowosc` varchar(255),
  `wojewodztwo` varchar(255),
  `nip` varchar(20),
  `regon` varchar(20),
  `rodzajkoncesji` varchar(255),
  `datacofniecia` date,
  `podstawaprawna` varchar(255),
  `uwagi` text
);

CREATE TABLE `concession_fuel` (
  `id` int,
  `dkn` varchar(255),
  `nazwa` varchar(255),
  `adres` varchar(255),
  `kod_pocztowy` varchar(255),
  `miejscowosc` varchar(255),
  `wojewodztwo` varchar(255),
  `nip` varchar(255),
  `poczta` varchar(255),
  `regon` varchar(255),
  `nrakcyzowy` varchar(255),
  `rodzajkoncesji` varchar(255),
  `datawydania` varchar(255),
  `dataod` varchar(255),
  `datado` varchar(255),
  `dataodzm` varchar(255),
  `datadozm` varchar(255),
  `vatue` varchar(255),
  `kodycn` text,
  `plik` varchar(255),
  `uwagi` varchar(255)
);

CREATE TABLE `concession_promise` (
  `id` int,
  `dkn` varchar(255),
  `nazwa` varchar(255),
  `adres` varchar(255),
  `kod_pocztowy` varchar(255),
  `miejscowosc` varchar(255),
  `wojewodztwo` varchar(255),
  `nip` varchar(20),
  `regon` varchar(20),
  `rodzajkoncesji` varchar(255),
  `datawydania` date,
  `dataod` date,
  `datado` date,
  `poczta` varchar(255)
);

CREATE TABLE `concession_other_fuel` (
  `id` int,
  `dkn` varchar(255),
  `nazwa` varchar(255),
  `poczta` varchar(255),
  `adres` varchar(255),
  `kod_pocztowy` varchar(10),
  `miejscowosc` varchar(255),
  `wojewodztwo` varchar(255),
  `nip` varchar(20),
  `regon` varchar(20),
  `nrakcyzowy` varchar(255),
  `rodzajkoncesji` varchar(255),
  `datawydania` datetime,
  `dataod` datetime,
  `datado` datetime,
  `plik` varchar(255),
  `uwagi` text
);

CREATE TABLE `concession_expiry` (
  `id` int,
  `dkn` varchar(255),
  `nazwa` varchar(255),
  `poczta` varchar(255),
  `adres` varchar(255),
  `kod_pocztowy` varchar(10),
  `miejscowosc` varchar(255),
  `wojewodztwo` varchar(255),
  `nip` varchar(20),
  `regon` varchar(20),
  `rodzajkoncesji` varchar(255),
  `datawygasniecia` datetime,
  `sposobrozstrzygniecia` varchar(255),
  `podstawaprawna` varchar(255),
  `uwagi` text
);

ALTER TABLE `concession_withdrawn` ADD CONSTRAINT `_` FOREIGN KEY (`nip`) REFERENCES `concession_fuel` (`nip`);

ALTER TABLE `concession_expiry` ADD CONSTRAINT `_` FOREIGN KEY (`nip`) REFERENCES `concession_fuel` (`nip`);

ALTER TABLE `concession_promise` ADD CONSTRAINT `_` FOREIGN KEY (`nip`) REFERENCES `concession_fuel` (`nip`);

ALTER TABLE `concession_withdrawn` ADD CONSTRAINT `_` FOREIGN KEY (`nip`) REFERENCES `concession_other_fuel` (`nip`);

ALTER TABLE `concession_expiry` ADD CONSTRAINT `_` FOREIGN KEY (`nip`) REFERENCES `concession_other_fuel` (`nip`);

ALTER TABLE `concession_promise` ADD CONSTRAINT `_` FOREIGN KEY (`nip`) REFERENCES `concession_other_fuel` (`nip`);
