/*1*/
SELECT  COUNT(DISTINCT f.Id_film) as Number_of_films,fs.Studio_name as Film_studio
FROM Film f INNER JOIN Movie_rental_order ON f.Id_film=Movie_rental_order.Id_film
INNER JOIN Film_studio fs ON fs.Id_film_studio=Movie_rental_order.Id_film_studio
GROUP BY fs.Studio_name 


/*2*/
SELECT YEAR(f.Release_date) AS year, MONTH(f.Release_date) AS month,
COUNT(f.Film_name) AS Films
FROM Film f 
GROUP BY YEAR(f.Release_date) , MONTH(f.Release_date) WITH ROLLUP;


SELECT YEAR(fs.Foundation_date) AS year, MONTH(fs.Foundation_date) AS month,
COUNT(fs.Studio_name) AS Films
FROM Film_studio fs 
GROUP BY YEAR(fs.Foundation_date) , MONTH(fs.Foundation_date) WITH ROLLUP; 

