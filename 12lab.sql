/*1 default distributor with id=100*/ 
CREATE TRIGGER Film_delete_Trigger 
ON Film1 AFTER DELETE 
AS
INSERT INTO Film2
SELECT * FROM deleted
WHERE Id_film=(SELECT Id_film FROM deleted)


SELECT * FROM Film1
SELECT * FROM Film2
 
 /*2*/
 CREATE TRIGGER Film_update
ON Film2
AFTER UPDATE
AS
DELETE FROM Film1 
WHERE Film1.Film_name=(SELECT Film_name FROM DELETED);


UPDATE Film2 SET Film_description='Hello' WHERE Id_film=5;


/*3*/
CREATE TRIGGER Film_insert
ON Film1
AFTER INSERT
AS
INSERT INTO Film2(Id_film,Film_name,Release_date,Director_name,Director_surname,Film_description,Genre,Film_time)
SELECT Id_film,Film_name,Release_date,Director_name,Director_surname,Film_description,Genre,Film_time
FROM inserted;


INSERT INTO Film1 VALUES (6,'Scarface','1983-12-1','Brayan','De Palma',NULL,'Criminal',153);
















SELECT * FROM Film1
SELECT * FROM Film2


DELETE FROM Film1 WHERE Id_film=4
SELECT * FROM Movie_rental_order

INSERT INTO Distributor VALUES (3,'Ukrain Films','0973860036','ukrfilms@urk.net','')
INSERT INTO Movie_rental_order VALUES (1,1,3,'2005-11-12',1)
INSERT INTO Movie_rental_order VALUES (3,3,3,'1999-12-12',5)

drop trigger Distributor_delete_Trigger
