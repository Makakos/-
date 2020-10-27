SELECT TABLE_NAME from INFORMATION_SCHEMA.TABLES
Exec sp_columns Movie_rental_order

/*1)Видалення зв’язку між таблицями*/
ALTER TABLE Movie_rental_order DROP CONSTRAINT FKfilm_studio

/*2)Видалення поля  і зміна розмірності поля в таблиці в таблиці Movie_rental_order*/
ALTER TABLE Movie_rental_order DROP COLUMN Id_film_studio 
ALTER TABLE Movie_rental_order ALTER COLUMN Order_date datetime2 NOT NULL  

/*3)Зміна поля в таблиці Film*/
ALTER TABLE Film ALTER COLUMN Film_name char(50) NOT NULL; 

/*4)Додавання поля і нового обмеження унікальності до таблиці Film*/
ALTER TABLE Film ADD Film_time INTEGER NULL
ALTER TABLE Film ADD CONSTRAINT UC_film_name UNIQUE(Film_name,Director_Name,Director_Surname); 

/*5)Зміна типу обмеження цілісності для зв’язку  FKfilm_rental_order,FKdistributor_rental_order,FKfilm_studio*/
ALTER TABLE Movie_rental_order
DROP CONSTRAINT FKfilm_rental_order
ALTER TABLE Movie_rental_order
ADD CONSTRAINT  FKfilm_rental_order FOREIGN KEY (Id_film) 
REFERENCES Film ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE Movie_rental_order
DROP CONSTRAINT FKdistributor_rental_order
ALTER TABLE Movie_rental_order
ADD CONSTRAINT  FKdistributor_rental_order FOREIGN KEY (Id_distributor) 
REFERENCES Distributor ON DELETE CASCADE ON UPDATE CASCADE

ALTER TABLE Movie_rental_order
DROP CONSTRAINT FKfilm_studio
ALTER TABLE Movie_rental_order
ADD CONSTRAINT  FKfilm_studio FOREIGN KEY (Id_film_studio) 
REFERENCES Film_studio ON DELETE CASCADE ON UPDATE CASCADE


exec sp_columns Movie_rental_order



