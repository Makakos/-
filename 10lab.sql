/*1*/
CREATE FUNCTION Encription (@Film_name char(50))
RETURNS varbinary(max)
BEGIN  
    DECLARE @Result varbinary(max)  
    SET @Result = EncryptByPassPhrase('passphrase',@Film_name) 
    RETURN @Result  
END



CREATE FUNCTION Decription (@Value_for_decription char(50))
RETURNS char(50)
BEGIN  
    DECLARE @Film_name char(50)  
    SET @Film_name = DecryptByPassPhrase('passphrase',@Value_for_decription)
    RETURN @Film_name  
END

SELECT Encription Film_name FROM Film; 

/*2*/
CREATE PROCEDURE Film_studio_films (@date1 datetime,@date2 datetime)
AS
BEGIN
    DECLARE @error CHAR;
	SET @error = 'Некоректно задані дати';
	IF (@date1<=@date2) 
	BEGIN
		SELECT  COUNT(DISTINCT f.Id_film) as Number_of_films,fs.Studio_name as Film_studio,@date1 as 'From', @date2 as 'To' 
		FROM Film f INNER JOIN Movie_rental_order ON f.Id_film=Movie_rental_order.Id_film
		INNER JOIN Film_studio fs ON fs.Id_film_studio=Movie_rental_order.Id_film_studio
		WHERE f.Release_date BETWEEN @date1 and @date2
		GROUP BY fs.Studio_name;
	END;
	ELSE SELECT @error;
END;



EXEC Film_studio_films'1980-05-05', '2015-01-01'; 


