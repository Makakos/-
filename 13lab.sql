/*1*/
EXEC sp_helpindex Film
GO
EXEC sp_helpindex Film_studio
GO

/*2*/
CREATE INDEX FilmIndex ON Film(Id_film,Film_name)
EXEC sp_helpindex Film
go

CREATE INDEX FilmStudioIndex ON Film_studio(Id_film_studio,Studio_name)
EXEC sp_helpindex Film_studio
go

/*3*/
SET SHOWPLAN_ALL ON;
GO
SELECT MAX(f.Film_name)as Film,fs.Studio_name as Film_studio,MAX(d.Company_name) as Distributor
FROM Film f INNER JOIN Movie_rental_order ON f.Id_film=Movie_rental_order.Id_film
INNER JOIN Film_studio fs ON fs.Id_film_studio=Movie_rental_order.Id_film_studio
INNER JOIN Distributor d ON d.Id_distributor=Movie_rental_order.Id_distributor
GROUP BY fs.Studio_name
GO
SET SHOWPLAN_ALL OFF;


SET SHOWPLAN_ALL ON;
GO
SELECT MAX(f.Film_name)as Film,fs.Studio_name as Film_studio,MAX(d.Company_name) as Distributor
FROM Film f LEFT JOIN Movie_rental_order ON f.Id_film=Movie_rental_order.Id_film
LEFT JOIN Film_studio fs ON fs.Id_film_studio=Movie_rental_order.Id_film_studio
LEFT JOIN Distributor d ON d.Id_distributor=Movie_rental_order.Id_distributor
GROUP BY fs.Studio_name
GO
SET SHOWPLAN_ALL OFF;


