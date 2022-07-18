CREATE DATABASE IF NOT EXISTS culdampolla;
USE culdampolla;

CREATE TABLE IF NOT EXISTS clients (
  clients_id INT NOT NULL AUTO_INCREMENT ,
  clients_nom VARCHAR(40) NOT NULL,
  clients_adreça VARCHAR(40) ,
  clients_email VARCHAR(40),
  clients_data TIMESTAMP DEFAULT CURRENT_TIMESTAMP NOT NULL,
  recomanat_per INT,
  PRIMARY KEY (clients_id),
  FOREIGN KEY(recomanat_per) REFERENCES clients(clients_id)
 );
 
 CREATE TABLE IF NOT EXISTS empleats (
  empleats_id INT NOT NULL AUTO_INCREMENT,
  empleats_nom VARCHAR(40) NOT NULL,
  PRIMARY KEY (empleats_id)
 
);
CREATE TABLE IF NOT EXISTS comandes (
  comandes_id INT NOT NULL AUTO_INCREMENT ,
  clients_id INT NOT NULL, 
  empleats_id INT NOT NULL,
  comandes_data DATE NOT NULL,
  PRIMARY KEY (comandes_id),
  FOREIGN KEY  (clients_id) REFERENCES clients(clients_id),
  FOREIGN KEY (empleats_id) REFERENCES empleats(empleats_id)
);
CREATE TABLE IF NOT EXISTS proveidors (
  proveidors_id INT NOT NULL AUTO_INCREMENT,
  proveidors_nom VARCHAR(40),
  proveidors_carrer VARCHAR(40),
  proveidors_numero VARCHAR(4),
  proveidors_pis VARCHAR(2),
  proveidors_porta VARCHAR(2),
  proveidors_ciutat VARCHAR(40),
  proveidors_cod_post VARCHAR(5),
  proveidors_telefon VARCHAR(12),
  proveidors_fax VARCHAR(12),
  proveidors_nif VARCHAR(10),
  PRIMARY KEY (proveidors_id)
);


CREATE TABLE IF NOT EXISTS  ulleres (
  ulleres_id INT AUTO_INCREMENT,
  ulleres_marca VARCHAR(40),
  ulleres_grad_od VARCHAR(10),
  ulleres_grad_oi VARCHAR(10),
  ulleres_montura VARCHAR(10),
  ulleres_col_muntura VARCHAR(10),
  ulleres_col_vidre VARCHAR(20),
  ulleres_preu DECIMAL,
  proveidors_id INT,
  PRIMARY KEY (ulleres_id),
  FOREIGN KEY (proveidors_id) REFERENCES proveidors(proveidors_id)
 
);




CREATE TABLE IF NOT EXISTS ulleres_comandes(
	 
    ulleres_id INT NOT NULL,
    comandes_id INT NOT NULL,
    PRIMARY KEY (ulleres_id,comandes_id),
    FOREIGN KEY(ulleres_id) REFERENCES ulleres(ulleres_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    FOREIGN KEY(comandes_id) REFERENCES comandes(comandes_id)
	ON DELETE CASCADE
    ON UPDATE CASCADE
    );

 INSERT INTO empleats ( empleats_nom) 
  VALUES( 'Joan'),('Josep'),('Pere'),('Xavi'),('Maria'),('Ana');



    
    -- Emplena
    INSERT INTO clients (
		 clients_nom ,
		 clients_adreça,
		 clients_email)
         VALUES 
		('client1', 'adreça1','email1'),
        ('client2', 'adreça2','email2'),
        ('client3', 'adreça3','email3'),
        ('client4', 'adreça4','email4'),
        ('client5', 'adreça5','email5'),
        ('client6', 'adreça6','email6');
        -- Asigna quin lient ha recomanat 
		UPDATE clients SET recomanat_per=1 WHERE clients_id=4;
        UPDATE clients SET recomanat_per=2 WHERE clients_id=6;
        UPDATE clients SET recomanat_per=6 WHERE clients_id=1;
	
    INSERT  INTO proveidors (
		proveidors_nom ,
		proveidors_carrer ,
		proveidors_numero ,
		proveidors_pis ,
		proveidors_porta ,
		proveidors_ciutat ,
		proveidors_cod_post ,
		proveidors_telefon ,
		proveidors_fax ,
		proveidors_nif )
        Values
        ('PROV1', 'Diputacio','78','','','Barcelona','08026','93333333','','B1234567'),
        ('PROV2', 'Pistaxo','23','3','','Roma','99999','869785852','','A52563'),
        ('PROV3', 'Bakers','88','','','London','19857','636623','','L52655');
 
 INSERT INTO ulleres(
  ulleres_marca ,
  ulleres_grad_od ,
  ulleres_grad_oi ,
  ulleres_montura ,
  ulleres_col_muntura ,
  ulleres_col_vidre ,
  ulleres_preu ,
  proveidors_id )
  VALUES
  ('Ulleres1','','','Metalica','Verd','Verd',150.0,1),
  ('Ulleres2','1','2','Pasta','Vermell','N/C',225.0,1),
  ('Ulleres3','0','1','Metalica','negre','blau',230.0,2),
  ('Ulleres4','1.5','1.3','Metalica','groc','N/C',85.0,2),
  ('Ulleres5','0.5','0.6','aire','groc','N/C',63.0,3);
        
  INSERT INTO comandes (
  clients_id ,
  empleats_id,
  comandes_data
 )
  VALUES
  (1,1,STR_TO_DATE("01-03-2010",'%d-%m-%Y')),
  (2,5,STR_TO_DATE('14-03-2010','%d-%m-%Y')),
  (3,3,STR_TO_DATE('23-02-2010','%d-%m-%Y')),
  (5,6,STR_TO_DATE('15-07-2010','%d-%m-%Y')),
  (6,3,STR_TO_DATE('16-07-2010','%d-%m-%Y')),
  (1,1,STR_TO_DATE('01-03-2014','%d-%m-%Y')),
  (2,5,STR_TO_DATE('14-03-2014','%d-%m-%Y')),
  (3,3,STR_TO_DATE('23-02-2014','%d-%m-%Y')),
  (5,6,STR_TO_DATE('15-07-2014','%d-%m-%Y')),
  (6,3,STR_TO_DATE('16-07-2014','%d-%m-%Y')),
  (1,1,STR_TO_DATE('01-03-2018','%d-%m-%Y')),
  (2,5,STR_TO_DATE('14-03-2018','%d-%m-%Y')),
  (3,3,STR_TO_DATE('23-02-2018','%d-%m-%Y')),
  (5,6,STR_TO_DATE('15-07-2018','%d-%m-%Y')),
  (6,3,STR_TO_DATE('16-07-2018','%d-%m-%Y')),
  (4,1,STR_TO_DATE('16-07-2010','%d-%m-%Y'));
  
  INSERT INTO ulleres_comandes(
  ulleres_id,
  comandes_id)
  VALUES 
  (1,1),
  (1,2),
  (3,4),
  (5,3),
  (4,5),
  (1,6),
  (2,7),
  (5,8),
  (5,9),
  (4,10),
  (3,11),
  (1,12),
  (3,13),
  (5,14),
  (4,15),
  (3,16);
  
  
  
-- Llista el total de factures d'un client/a en un període determinat.


SELECT clients.clients_id,clients.clients_nom,comandes_id,date_format(comandes_data,'%d-%m-%Y') FROM clients,comandes 
WHERE comandes.clients_id=clients.clients_id 
AND clients_nom='client1'
AND comandes_data BETWEEN str_to_date('01-01-2010','%d-%m-%Y') AND str_to_date('01-01-2017','%d-%m-%Y');

-- Llista els diferents models d'ulleres que ha venut un empleat/da durant un any.

SELECT comandes.comandes_id, comandes.empleats_id, empleats_nom, ulleres.ulleres_id,ulleres_marca
FROM comandes,empleats,ulleres,ulleres_comandes
where comandes.empleats_id=empleats.empleats_id
AND empleats_nom='Joan'
AND comandes.comandes_id=ulleres_comandes.comandes_id
AND ulleres_comandes.ulleres_id=ulleres.ulleres_id
AND comandes_data BETWEEN str_to_date('01-01-2010','%d-%m-%Y') AND str_to_date('31-12-2010','%d-%m-%Y');

