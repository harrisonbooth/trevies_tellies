DROP TABLE IF EXISTS televisions;
DROP TABLE IF EXISTS manufacturers;

CREATE TABLE manufacturers(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255),
  model_temp VARCHAR(255)
);

CREATE TABLE televisions(
  id SERIAL8 PRIMARY KEY,
  model_no VARCHAR(255),
  stock INT4,
  manufacturer_id INT8 REFERENCES manufacturers( id ) ON DELETE CASCADE
);  