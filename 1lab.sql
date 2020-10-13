use Movie_rental
go
CREATE TABLE Film_studio  (
	Id_film_studio INTEGER NOT NULL,
	Studio_name CHAR(40) NOT NULL,
	Foundation_date DATE NOT NULL,
	Founder_name  CHAR(20) NOT NULL,
	Founder_surname CHAR(20) NOT NULL,
	Studio_site  VARCHAR(max),
PRIMARY KEY (Id_film_studio) ); 


CREATE TABLE Distributor  (
	Id_distributor  INTEGER NOT NULL,
	Company_name  CHAR(40) NOT NULL,
	Company_phone  INTEGER NOT NULL,
	Company_email CHAR(30),
	Company_site   VARCHAR(max),
PRIMARY KEY (Id_distributor) );


CREATE TABLE Cinema   (
	Id_cinema   INTEGER NOT NULL,
	Cinema_name   CHAR(20) NOT NULL,
	City  CHAR(20) NOT NULL,
	Street CHAR(20) NOT NULL,
	Building_number  CHAR(5) NOT NULL,
	Cinema_email CHAR(30),
	Cinema_site   VARCHAR(max),
PRIMARY KEY (Id_cinema) ,
);    


CREATE TABLE Video_rental_store   (
	Id_store    INTEGER NOT NULL,
	Store_name    CHAR(20) NOT NULL,
	City  CHAR(20) NOT NULL,
	Street CHAR(20) NOT NULL,
	Building_number  CHAR(5) NOT NULL,
PRIMARY KEY (Id_store ),
);    


CREATE TABLE Film   (
	Id_film     INTEGER NOT NULL,
	Film_name    CHAR(40) NOT NULL,
	Release_date DATE NOT NULL,
	Director_name    CHAR(20) NOT NULL,
	Director_surname    CHAR(20) NOT NULL,
	Film_description   VARCHAR(max) ,
	Genre  CHAR(15) NOT NULL,
PRIMARY KEY (Id_film ),
);

CREATE TABLE Movie_rental_order   (
	Id_order   INTEGER NOT NULL,
	Id_film     INTEGER NOT NULL,
	Id_distributor  INTEGER NOT NULL,
	Id_film_studio  INTEGER NOT NULL,
	Order_date DATE NOT NULL,
PRIMARY KEY (Id_order ),
CONSTRAINT  FKfilm_rental_order FOREIGN KEY (Id_film) 
REFERENCES Film ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT  FKdistributor_rental_order FOREIGN KEY (Id_distributor) 
REFERENCES Distributor ON DELETE CASCADE ON UPDATE CASCADE ,
CONSTRAINT  FKfilm_studio FOREIGN KEY (Id_film_studio) 
REFERENCES Film_studio ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Rental_in_cinema (
Id_rental   INTEGER NOT NULL,
Id_film    INTEGER NOT NULL,
Id_distributor  INTEGER NOT NULL,
Id_cinema     INTEGER NOT NULL,
PRIMARY KEY (Id_rental ),
CONSTRAINT  FKfilm_in_cinema FOREIGN KEY (Id_film) 
REFERENCES Film ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT  FKdistributor_in_cinema FOREIGN KEY (Id_distributor) 
REFERENCES Distributor ON DELETE CASCADE ON UPDATE CASCADE, 
CONSTRAINT  FKcinema FOREIGN KEY (Id_cinema) 
REFERENCES Cinema ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Rental_in_store (
Id_rental   INTEGER NOT NULL,
Id_film    INTEGER NOT NULL,
Id_distributor  INTEGER NOT NULL,
Id_store     INTEGER NOT NULL,
PRIMARY KEY (Id_rental ),
CONSTRAINT  FKfilm_in_store FOREIGN KEY (Id_film) 
REFERENCES Film ON DELETE CASCADE ON UPDATE CASCADE,
CONSTRAINT  FKdistributor_in_store FOREIGN KEY (Id_distributor) 
REFERENCES Distributor ON DELETE CASCADE ON UPDATE CASCADE, 
CONSTRAINT  FKvideo_rental_store FOREIGN KEY (Id_store) 
REFERENCES Video_rental_store ON DELETE CASCADE ON UPDATE CASCADE
);
