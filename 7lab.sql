

/*1*/
FROM Film
WHERE Id_film=5

/*2 αδ Films*/

SELECT fs.Studio_name,fs.Foundation_date,d.Id_distributor,d.Company_name
FROM Film_studio fs LEFT JOIN Distributor d ON d.Id_film_studio=fs.Id_film_studio 




/*3 αδ Films*/
SELECT fs.Id_film_studio,fs.Studio_name,f.Id_film,f.Film_name,f.Genre
FROM Film_studio fs INNER JOIN Film f ON fs.Id_film_studio=f.Id_film_studio
WHERE fs.Studio_name='A band apart';

/*4*/
SELECT fs.Studio_name,fs.Foundation_date,f.Film_name,f.Director_name,f.Director_surname,d.Company_name
FROM Film_studio fs INNER JOIN Movie_rental_order mro
ON fs.Id_film_studio=mro.Id_film_studio INNER JOIN Film f
ON f.Id_film=mro.Id_film INNER JOIN Distributor d
ON d.Id_distributor=mro.Id_distributor
WHERE d.Company_name in ('Crazy Parrot','Ukrainian Film')

/*5 αδ Films*/
SELECT f.Film_name,f.Release_date,fs.Studio_name
FROM Film f INNER JOIN Film_studio fs
ON f.Id_film_studio=fs.Id_film_studio
WHERE f.Id_film_studio IN (SELECT d.Id_film_studio FROM Distributor d
WHERE d.Company_name in ('B&H Films') )
ORDER BY f.Release_date DESC 

/*6*/
SELECT Distributor.Company_name
FROM Distributor
WHERE  NOT EXISTS( SELECT * FROM Film_studio 
WHERE Film_studio.Id_film_studio=Distributor.Id_film_studio)


/*7*/

SELECT Film_studio
WHERE 




SELECT fs.Studio_name,fs.Foundation_date,f.Film_name,f.Director_name,f.Director_surname,d.Company_name,mro.Order_date
FROM Film_studio fs INNER JOIN Movie_rental_order mro
ON fs.Id_film_studio=mro.Id_film_studio INNER JOIN Film f
ON f.Id_film=mro.Id_film INNER JOIN Distributor d
ON d.Id_distributor=mro.Id_distributor
ORDER BY mro.Order_date DESC










