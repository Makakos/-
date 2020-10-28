/*1*/
INSERT INTO Film VALUES (1,'Kill Bill','2003-10-10','Quentin','Tarantino','','Action',110);


INSERT INTO Film VALUES (2,'Tenet','2020-08-12','Cristopher','Nolan','','Action',154);
INSERT INTO Film VALUES (3,'Green mile','1999-6-12','Frank','Darabont','','Drama',145);
INSERT INTO Film VALUES (4,'Django unchained','2013-01-17','Quentin','Tarantino','','Action',122);
INSERT INTO Film VALUES (5,'Catch me if you can','2002-12-25','Steven','Spilberg','','Сriminal',114);

/*2*/
BULK 
INSERT Client 
FROM ' D:\Универ\5 семестр\СУБД\distributors.csv'
WITH 
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);
BULK 
INSERT Seller
FROM 'D:\Универ\5 семестр\СУБД\studios.csv'
WITH 
(
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
);

/*3*/
UPDATE Film_studio SET Studio_site='www.dreamworks.com'
WHERE Studio_name ='Dreamworks';

SELECT Film_time FROM Film
UPDATE Film SET Film_time = Film_time + 2

/*4*/
DELETE FROM Film_studio
Where Foundation_date<'1982-01-01' OR Studio_name='Sony Pictures'


