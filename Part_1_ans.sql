CREATE DATABASE assignment;
SHOW DATABASES;
USE assignment;
SHOW TABLES;

### Creating table
CREATE TABLE countries (
    name VARCHAR(80) NOT NULL,
    population INT,
    capital VARCHAR(80)
);

### Inserting values
INSERT INTO countries values("China",1382,"Beijing"),
("India",1326,"Delhi"),
("United States",324,"Washington D.C."),
("Indonesia",260,"Jakarta"),
("Brazil",209,"Brasilia"),
("Pakistan",193,"Islamabad"),
("Nigeria",187,"Abuja"),
("Bangladesh",163,"Dhaka"),
("Russia",143,"Moscow"),
("Mexico",128,"Mexico City"),
("Japan",126,"Tokyo"),
("Philippines",102,"Manila"),
("Ethiopia",101,"Addis Ababa"),
("Vietnam",94,"Hanoi"),
("Egypt",93,"Cairo"),
("Germany",81,"Berlin"),
("Iran",80,"Tehran"),
("Turkey",79,"Ankara"),
("Congo",79,"Kinhasa"),
("France",64,"Paris"),
("United Kingdom",65,"London"),
("Italy",60,"Rome"),
("South Africa",55,"Pretoria"),
("Mynmar",54,"Naypyidaw");

set sql_safe_updates=0;

## Adding more countries
Insert into countries values("Iceland",44,"Reykjavík"),
("Canada",52,"Ottawa");

##updating Delhi to New Delhi
UPDATE countries 
SET 
    capital = 'New Delhi'
WHERE
    name = 'India';
    
## Renaming the table
RENAME TABLE countries to big_countries;

-- 5) creating tables

CREATE TABLE Products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(50) NOT NULL UNIQUE,
    description VARCHAR(250),
    supplier_id INTEGER
);
CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(80),
    location VARCHAR(80)
);
CREATE TABLE Stock (
    id SERIAL PRIMARY KEY,
    product_id INTEGER NOT NULL,
    balance_stock INTEGER
);

-- INSERTING VALUES IN THE TABLES
INSERT INTO Products(product_name, description, supplier_id)
VALUES ("GALAXY", "samsung phone",2),
		("iphone13","apple phone",1),
        ("LAPTOP","DELL",3);
        
INSERT INTO Suppliers(supplier_name, location)
VALUES("A","MUM"),("B","LA"),("C","ICELAND");

INSERT INTO Stock(product_id, balance_stock)
VALUES
(2,45),
(7,25),
(1,82),
(5,12),
(3,47);

##Updating the datatype of product(supplier id )
ALTER TABLE suppliers
MODIFY COLUMN supplier_id INTEGER;

## Adding FOREIGN KEY To add relations;
 ALTER TABLE products
     ADD CONSTRAINT fk_s
     FOREIGN KEY (supplier_id)
     REFERENCES suppliers(supplier_id);
     
     
ALTER TABLE stock 
	ADD CONSTRAINT fk_p 
    FOREIGN KEY(product_id) 
    REFERENCES products(product_id);
    
    
    
## modifying the supplier table
desc suppliers;

AlTER TABLE suppliers 
MODIFY COLUMN supplier_name VARCHAR(80) UNIQUE NOT NULL;

### modifying the emp table
desc emp;

ALTER TABLE emp
	ADD COLUMN dept_no DECIMAL;
    
    
-- Adding  values

#disabaling safe mode
SET SQL_SAFE_UPDATES = 0;

UPDATE emp SET dept_no =(CASE
WHEN (emp_no % 2) THEN 20
WHEN (emp_no % 3) THEN 30
WHEN (emp_no % 4) THEN 40
ELSE 10
END);

#enabaling safe mode
SET SQL_SAFE_UPDATES = 1;

-- Creatng a new unique index
CREATE UNIQUE INDEX u_idx on emp(emp_no);

-- creating a view 
# a view is a virtual table that contains rows and columns, just like a real table.
# The fields in a view are fields from one or more real tables in the database.
CREATE VIEW emp_sal AS
	SELECT
		emp_no,
        first_name,
        last_name,
        salary
	FROM 
		emp;



     
     

     
     


    