-- Drop tables if they exist
DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS televisions;
DROP TABLE IF EXISTS manufacturers;
DROP TABLE IF EXISTS customers;

-- Create customers table
CREATE TABLE customers(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  contact_no VARCHAR(255)
);

-- Create manufacturers table
CREATE TABLE manufacturers(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  model_temp VARCHAR(255),
  markup NUMERIC(8, 2)
);

-- Create televisions table
CREATE TABLE televisions(
  id SERIAL8 PRIMARY KEY,
  model_no VARCHAR(255),
  stock INT4,
  cost_price NUMERIC(8, 2),
  retail_price NUMERIC(8, 2),
  manufacturer_id INT8 REFERENCES manufacturers( id ) ON DELETE CASCADE
);  

-- Create sales table
CREATE TABLE sales(
  id SERIAL8 PRIMARY KEY,
  customer_id INT8 REFERENCES customers( id ) ON DELETE CASCADE,
  television_id INT8 REFERENCES televisions( id ) ON DELETE CASCADE
);

-- Populate manufacturers table with some popular manufacturers
INSERT INTO manufacturers( name, model_temp, markup ) VALUES ( 'Samsung', 'UE', 1.65 );
INSERT INTO manufacturers( name, model_temp, markup ) VALUES ( 'Sony', 'KDL', 1.82 );
INSERT INTO manufacturers( name, model_temp, markup ) VALUES ( 'Panasonic', 'TX', 1.76 )