-- BASE DE DADES PIZZERIA
CREATE DATABASE IF NOT EXISTS pizzeria;
USE pizzeria ;


-- CREACIÓ DE LES DIFERENTS TAULES

CREATE TABLE IF NOT EXISTS clients (
  clients_id INT NOT NULL AUTO_INCREMENT,
  clients_nom VARCHAR(45) NOT NULL,
  clients_cognom VARCHAR(45) NOT NULL,
  clients_adreça VARCHAR(45) NOT NULL,
  clients_cp INT NOT NULL,
  clients_localitat VARCHAR(45) NOT NULL,
  clients_provincia VARCHAR(45) NOT NULL,
  clients_tel VARCHAR(45) NOT NULL,
  PRIMARY KEY (clients_id));
 
CREATE TABLE IF NOT EXISTS botigues (
  botigues_id INT NOT NULL AUTO_INCREMENT,
  botigues_adreça VARCHAR(45) NOT NULL,
  botigues_cp VARCHAR(45) NOT NULL,
  botigues_localitat VARCHAR(45) NOT NULL,
  botigues_prov VARCHAR(45) NOT NULL,
  PRIMARY KEY (botigues_id));




CREATE TABLE IF NOT EXISTS empleats (
  empleats_id INT NOT NULL AUTO_INCREMENT,
  empleats_nom VARCHAR(45) NOT NULL,
  empleats_cognoms VARCHAR(45) NOT NULL,
  empleats_nif VARCHAR(45)  NOT NULL,
  empleats_tel VARCHAR(45) NOT NULL,
  botigues_id INT NOT NULL,
  empleats_repatidor BOOLEAN NOT NULL,
  PRIMARY KEY (empleats_id),
  FOREIGN KEY (botigues_id)
  REFERENCES botigues (botigues_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE);




CREATE TABLE IF NOT EXISTS comandes (
  comandes_id INT NOT NULL AUTO_INCREMENT,
  comandes_data DATETIME  NOT NULL,
  comandes_rep BOOLEAN NOT NULL,
  clients_id INT NOT NULL,
  botigues_id INT NOT NULL,
  empleats_id INT NOT NULL,
  comandes_data_entrega DATETIME,
  PRIMARY KEY (comandes_id),
  FOREIGN KEY (clients_id)
  REFERENCES clients (clients_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (botigues_id)
  REFERENCES botigues (botigues_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (empleats_id)
  REFERENCES empleats (empleats_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE);

CREATE TABLE IF NOT EXISTS categories (
  categories_id INT NOT NULL AUTO_INCREMENT,
  categories_nom VARCHAR(45) NOT NULL,
  PRIMARY KEY (categories_id));

CREATE TABLE IF NOT EXISTS producte (
  producte_id INT NOT NULL AUTO_INCREMENT,
  producte_tipus VARCHAR(45) NOT NULL, -- Hamburguesa, Pizza, Beguda
  producte_nom VARCHAR(45) NOT NULL,
  producte_descripcio VARCHAR(45) ,
  productes_imatge  BLOB,
  producte_preu FLOAT NOT NULL,
  categories_id INT,
  PRIMARY KEY (producte_id),
  FOREIGN KEY (categories_id) 
  REFERENCES categories (categories_id));




CREATE TABLE IF NOT EXISTS comandes_producte (
  producte_id INT NOT NULL ,
  comandes_id INT NULL,
  FOREIGN KEY (comandes_id)
  REFERENCES comandes (comandes_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE,
  FOREIGN KEY (producte_id)
  REFERENCES producte (producte_id)
  ON DELETE CASCADE
  ON UPDATE CASCADE);
  
  -- INSERT DE LES DIFERENTS TAULES
 
  
	
   INSERT INTO clients (
	clients_nom ,
	clients_cognom ,
	clients_adreça ,
	clients_cp ,
	clients_localitat ,
	clients_provincia ,
	clients_tel)
	VALUES
   ('clients1_nom','clients1_cognom', 'clients1_adreça',1,'clients1_localitat','clients1_provincia','clients1_tel'),
   ('clients2_nom','clients2_cognom', 'clients2_adreça',1,'clients2_localitat','clients2_provincia','clients2_tel'),
   ('clients3_nom','clients3_cognom', 'clients3_adreça',1,'clients3_localitat','clients3_provincia','clients3_tel'),
   ('clients4_nom','clients4_cognom', 'clients4_adreça',1,'clients4_localitat','clients4_provincia','clients4_tel'),
   ('clients5_nom','clients5_cognom', 'clients5_adreça',1,'clients5_localitat','clients5_provincia','clients5_tel'),
   ('clients6_nom','clients6_cognom', 'clients6_adreça',1,'clients6_localitat','clients6_provincia','clients6_tel'),
   ('clients7_nom','clients7_cognom', 'clients7_adreça',1,'clients7_localitat','clients7_provincia','clients7_tel'),
   ('clients8_nom','clients8_cognom', 'clients8_adreça',1,'clients8_localitat','clients8_provincia','clients8_tel'),
   ('clients_nom','clients9_cognom', 'clients9_adreça',1,'clients9_localitat','clients9_provincia','clients9_tel'),
   ('clients10_nom','clients10_cognom', 'clients10_adreça',1,'clients10_localitat','clients10_provincia','clients10_tel');

 
  
  INSERT INTO botigues(
  botigues_cp,
  botigues_adreça,
  botigues_localitat,
  botigues_prov)
  VALUES 
  ('cp1','adreça1','loccalitat1','prov1'),
  ('cp2','adreça2','localitat2','prov2'),
  ('cp3','adreça3','localitat2','prov3'),
  ('cp4','adreça4','localitat3','prov4'),
  ('cp5','adreça5','localitat4','prov5');
 
  
  
  INSERT INTO empleats(
  empleats_nom,
  empleats_cognoms,
  empleats_nif,
  empleats_tel,
  botigues_id,
  empleats_repatidor)
  VALUES
  ('empleats_nom1','empleats_cognoms1','empleats_nif1','empleats_tel1',3,TRUE),
  ('empleats_nom2','empleats_cognoms2','empleats_nif2','empleats_tel2',3,TRUE),
  ('empleats_nom3','empleats_cognoms3','empleats_nif3','empleats_tel3',2,FALSE),
  ('empleats_nom4','empleats_cognoms4','empleats_nif4','empleats_tel4',1,TRUE),
  ('empleats_nom5','empleats_cognoms5','empleats_nif5','empleats_tel5',1,FALSE),
  ('empleats_nom6','empleats_cognoms6','empleats_nif6','empleats_tel6',1,TRUE),
  ('empleats_nom7','empleats_cognoms7','empleats_nif7','empleats_tel7',5,TRUE),
  ('empleats_nom8','empleats_cognoms8','empleats_nif8','empleats_tel8',4,FALSE),
  ('empleats_nom8','empleats_cognoms9','empleats_nif9','empleats_tel9',4,TRUE),
  ('empleats_nom10','empleats_cognoms10','empleats_nif10','empleats_tel10',2,TRUE);
  
 
  
  INSERT INTO comandes (
  comandes_data,
  comandes_rep,
  clients_id,
  botigues_id,
  empleats_id)
  VALUES
  (current_timestamp(),TRUE,2,3,1),
  (current_timestamp(),TRUE,5,2,3),
  (current_timestamp(),FALSE,4,4,3),
  (current_timestamp(),FALSE,4,5,3),
   (current_timestamp(),TRUE,2,3,1),
  (current_timestamp(),TRUE,5,2,3),
  (current_timestamp(),FALSE,4,4,9),
  (current_timestamp(),FALSE,4,5,7);
  
  
  
  INSERT INTO categories (
  categories_nom)
  VALUES
  ('categoria1'),('categoria2'),('categoria3');
    
    
	
   
  INSERT INTO producte(
  producte_tipus,
  producte_nom,
  producte_descripcio,
  producte_preu)
    VALUES
  ('Beguda','producte_nom1','descripcio1',2.5),
  ('Beguda','producte_nom2','descripcio2',2.5),
  ('Hamburguesa','producte_nom3','descripcio3',2.5),
  ('Hamburguesa','producte_nom4','descripcio4',2.5),
  ('Hamburguesa','producte_nom5','descripcio5',2.5);
  
  INSERT INTO producte(
  producte_tipus,
  producte_nom,
  producte_descripcio,
  producte_preu,
  categories_id)
  VALUES  
  ('Pizza','producte_nom6','descripcio6',2.5,1),
  ('Pizza','producte_nom7','descripcio7',2.5,2),
  ('Pizza','producte_nom8','descripcio8',2.5,3);
 
 
  
  INSERT INTO comandes_producte(
  comandes_id,
  producte_id)
  VALUES
  (1,3),
  (2,5),
  (3,4),
  (4,2),
  (5,3),
  (6,1),
  (7,2),
  (8,2);
 
 -- Llista quants productes de categoria 'Begudes' s'han venut en una determinada localitat.
 
  SELECT comandes.comandes_id,producte.producte_id, producte.producte_tipus, producte.producte_nom, botigues.botigues_localitat
  from comandes,producte,comandes_producte,botigues
  WHERE comandes.comandes_id=comandes_producte.comandes_id
  AND comandes_producte.producte_id=producte.producte_id
  AND producte.producte_tipus='Beguda'
  AND comandes.botigues_id=botigues.botigues_id
  AND botigues.botigues_localitat='localitat4';
    
  -- Llista quantes comandes ha efectuat un determinat empleat/da.
 SELECT comandes.comandes_id,empleats.empleats_nom, empleats.empleats_cognoms  FROM comandes,empleats
 WHERE comandes.empleats_id=empleats.empleats_id
 AND empleats.empleats_cognoms='empleats_cognoms3';
  
  
 
  
 
  
