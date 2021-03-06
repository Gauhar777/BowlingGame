CREATE TABLE dezhurny (id int(11) NOT NULL AUTO_INCREMENT, id_gamer int(11) NOT NULL, time timestamp, id_competition int(11), PRIMARY KEY (id));
CREATE TABLE partner (id int(11) NOT NULL AUTO_INCREMENT, id_gamer int(10) NOT NULL, id_competition int(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE competition (id int(10) NOT NULL AUTO_INCREMENT, name varchar(255), dezhurnyid int(11), PRIMARY KEY (id));
CREATE TABLE game (id int(10) NOT NULL AUTO_INCREMENT, id_partner1 int(11) NOT NULL, id_partner2 int(11) NOT NULL, point1 int(10), point2 int(10), id_competition int(10) NOT NULL, PRIMARY KEY (id));
CREATE TABLE gamer (id int(10) NOT NULL AUTO_INCREMENT, FIO varchar(255) NOT NULL, nick varchar(255) NOT NULL, dezhurnyid int(11), PRIMARY KEY (id));
ALTER TABLE game ADD INDEX FKgame110594 (id_competition), ADD CONSTRAINT FKgame110594 FOREIGN KEY (id_competition) REFERENCES competition (id);
ALTER TABLE competition ADD INDEX FKcompetitio961737 (dezhurnyid), ADD CONSTRAINT FKcompetitio961737 FOREIGN KEY (dezhurnyid) REFERENCES dezhurny (id);
ALTER TABLE gamer ADD INDEX FKgamer556768 (dezhurnyid), ADD CONSTRAINT FKgamer556768 FOREIGN KEY (dezhurnyid) REFERENCES dezhurny (id);
ALTER TABLE partner ADD INDEX FKpartner373701 (id_competition), ADD CONSTRAINT FKpartner373701 FOREIGN KEY (id_competition) REFERENCES competition (id);
ALTER TABLE partner ADD INDEX FKpartner370290 (id_gamer), ADD CONSTRAINT FKpartner370290 FOREIGN KEY (id_gamer) REFERENCES gamer (id);
ALTER TABLE game ADD INDEX FKgame55025 (id_partner1), ADD CONSTRAINT FKgame55025 FOREIGN KEY (id_partner1) REFERENCES partner (id);
ALTER TABLE game ADD INDEX FKgame55024 (id_partner2), ADD CONSTRAINT FKgame55024 FOREIGN KEY (id_partner2) REFERENCES partner (id);
ALTER TABLE game ADD INDEX FKgame15283 (id_partner2), ADD CONSTRAINT FKgame15283 FOREIGN KEY (id_partner2) REFERENCES gamer (id);
