/*1*/
CREATE VIEW Film_studio2 AS SELECT DISTINCT Id_film_studio, Studio_name, Foundation_date
FROM Film_studio



/*2*/
SELECT *
FROM Film_studio2
WHERE PATINDEX('%o%',Studio_name)>0

/*3*/
SELECT Film.Id_film,Film.Film_name,Film.Genre,Film_studio2.Id_film_studio,Film_studio2.Studio_name,
	   Movie_rental_order.Id_film,Movie_rental_order.Id_film_studio
FROM Film ,Film_studio2,Movie_rental_order
WHERE Film.Id_film=Movie_rental_order.Id_film AND Film_studio2.Id_film_studio=Movie_rental_order.Id_film_studio


/*4*/
SELECT Film.Id_film,Film.Film_name,Film.Release_date,Film_studio2.Id_film_studio,Film_studio2.Studio_name,Film_studio2.Foundation_date,
	   Movie_rental_order.Id_film,Movie_rental_order.Id_film_studio
FROM Film ,Film_studio2,Movie_rental_order
WHERE Film.Id_film=Movie_rental_order.Id_film AND Film_studio2.Id_film_studio=Movie_rental_order.Id_film_studio
AND Film.Release_date>Film_studio2.Foundation_date