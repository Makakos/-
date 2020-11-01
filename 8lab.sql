/*1*/
SELECT *
FROM Distributor
WHERE Company_name LIKE('%Film%')
ORDER BY Company_name

/*2*/
SELECT Id_film,Film_name,Release_date,Film_time
FROM Film
ORDER BY Release_date DESC

/*3*/

SELECT MAX(f.Film_name)as Film,fs.Studio_name as Film_studio,MAX(d.Company_name) as Distributor
FROM Film f INNER JOIN Movie_rental_order ON f.Id_film=Movie_rental_order.Id_film
INNER JOIN Film_studio fs ON fs.Id_film_studio=Movie_rental_order.Id_film_studio
INNER JOIN Distributor d ON d.Id_distributor=Movie_rental_order.Id_distributor
GROUP BY fs.Studio_name
