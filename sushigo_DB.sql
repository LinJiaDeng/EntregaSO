DROP DATABASE IF EXISTS sushigo;
CREATE DATABASE sushigo;

USE sushigo;

CREATE TABLE PLAYER (
	ID INT NOT NULL,
	NAME VARCHAR(20) NOT NULL,
	PASSWORD VARCHAR(20) NOT NULL,
 	GAMES_WON INT,
	BEST_GAME INT,
	PRIMARY KEY (ID)
);

CREATE TABLE CARD (
	ID INT NOT NULL,
	NAME VARCHAR(20) NOT NULL,
	POINTS INT NOT NULL,
	SPECIAL VARCHAR(20),
	PRIMARY KEY (ID)
);

CREATE TABLE HAND (
	ID_P INT NOT NULL,
	ID_C INT NOT NULL,
	NUMBER_OF_CARDS INT,
	FOREIGN KEY (ID_P) REFERENCES PLAYER(ID),
	FOREIGN KEY (ID_C) REFERENCES CARD(ID)
);

CREATE TABLE ROUND_SCORE (
	ID INT NOT NULL,
	ID_P INT NOT NULL,
	ID_C INT NOT NULL,
	NUMBER_OF_CARDS INT,
	SCORE INT,		
	FOREIGN KEY (ID_P) REFERENCES PLAYER(ID),
	FOREIGN KEY (ID_C) REFERENCES CARD(ID)
);

CREATE TABLE GAME (
	ID_P INT NOT NULL,
	ID_R INT NOT NULL,
	TOTAL SCORE INT,
	FOREIGN KEY (ID_P) REFERENCES PLAYER(ID),
	FOREIGN KEY (ID_R) REFERENCES ROUND_SCORE(ID)
);

INSERT INTO PLAYER (ID,NAME,PASSWORD,GAMES_WON) VALUES ('1','Lin','123','0');
INSERT INTO PLAYER (ID,NAME,PASSWORD,GAMES_WON) VALUES ('2','Pau','321','0');
INSERT INTO PLAYER (ID,NAME,PASSWORD,GAMES_WON) VALUES ('3','Guille','213','0');
INSERT INTO PLAYER (ID,NAME,PASSWORD,GAMES_WON) VALUES ('4','Dani','312','0');

INSERT INTO CARD (ID,NAME,POINTS) VALUES ('1','Palillos','0');
INSERT INTO CARD (ID,NAME,POINTS) VALUES ('2','Wasabi','0');
INSERT INTO CARD (ID,NAME,POINTS) VALUES ('3','Pudín','0');
INSERT INTO CARD (ID,NAME,POINTS) VALUES ('4','Gyoza','0');
INSERT INTO CARD (ID,NAME,POINTS) VALUES ('5','Nigiri de Calamar','3');
INSERT INTO CARD (ID,NAME,POINTS) VALUES ('6','Nigiri de Salmón','2');
INSERT INTO CARD (ID,NAME,POINTS) VALUES ('7','Nigiri de Tortilla','1');

INSERT INTO HAND VALUES ('1','3','1');
INSERT INTO HAND VALUES ('2','3','2');
INSERT INTO HAND VALUES ('3','2','1');
INSERT INTO HAND VALUES ('4','1','1');

INSERT INTO ROUND_SCORE VALUES ('1','1',3,'1','13');
INSERT INTO ROUND_SCORE VALUES ('1','2',2,'1','15');
INSERT INTO ROUND_SCORE VALUES ('1','3',6,'1','10');
INSERT INTO ROUND_SCORE VALUES ('1','4',7,'1','14');
INSERT INTO ROUND_SCORE VALUES ('2','1',3,'1','20');

