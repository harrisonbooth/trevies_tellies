DROP TABLE IF EXISTS televisions;
DROP TABLE IF EXISTS manufacturers;

CREATE TABLE manufacturers(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  model_temp VARCHAR(255),
  markup NUMERIC(8, 2)
);

CREATE TABLE televisions(
  id SERIAL8 PRIMARY KEY,
  model_no VARCHAR(255),
  stock INT4,
  cost_price NUMERIC(8, 2),
  retail_price NUMERIC(8, 2),
  manufacturer_id INT8 REFERENCES manufacturers( id ) ON DELETE CASCADE
);  

INSERT INTO manufacturers( name, model_temp, markup ) VALUES ( 'Samsung', 'UE', 1.65 );
INSERT INTO manufacturers( name, model_temp, markup ) VALUES ( 'Sony', 'KDL', 1.82 );
INSERT INTO manufacturers( name, model_temp, markup ) VALUES ( 'Panasonic', 'TX', 1.76 )