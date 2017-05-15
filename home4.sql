CREATE TABLE brands
(
  id SERIAL  PRIMARY KEY,
  name  VARCHAR(255) NOT NULL,
  CONSTRAINT products_name_uindex
  UNIQUE (name)
)

CREATE TABLE categories
(
  id SERIAL  PRIMARY KEY,
  name  VARCHAR(255) NOT NULL,
  CONSTRAINT products_name_uindex
  UNIQUE (name)
)

ALTER TABLE  products ADD  categor_id BIGINT UNSIGNED NOT NULL ;
ALTER TABLE  products ADD  brand_id BIGINT UNSIGNED NOT NULL ;


ALTER TABLE products
ADD FOREIGN KEY  (categor_id)
REFERENCES categories (id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

ALTER TABLE products
ADD FOREIGN KEY ( brand_id ) 
REFERENCES brands( id ) 
ON DELETE RESTRICT 
ON UPDATE CASCADE

SELECT * 
FROM products
INNER JOIN categories ON products.categor_id = categories.id

SELECT products.name AS NAME, categories.name AS CATEGORY, brands.name AS BRAND
FROM products 
INNER JOIN categories ON products.categor_id = categories.id
INNER JOIN brands ON products.brand_id = brands.id

SELECT products.name
FROM  products 
INNER JOIN brands ON products.brand_id = brands.id
WHERE brands.name LIKE  'A%'

SELECT categories.name, (
SELECT COUNT( * ) 
FROM products
WHERE categories.id = products.categor_id
) AS AMOUNT
FROM categories
ORDER BY categories.name

