SELECT categories.name, (
SELECT AVG(products.price)
FROM products
WHERE categories.id = products.categor_id
) AS Price
FROM categories
HAVING Price < 1000
ORDER BY categories.name

SELECT categories.name, (
SELECT AVG(products.price) 
FROM products 
WHERE categories.id = products.categor_id 
AND products.counts > 0 )
AS Price 
FROM categories 
HAVING Price > 3300
ORDER BY categories.name

CREATE TABLE `DBA`.`orders` ( `id` SERIAL NOT NULL , `timeAndDate` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,product_id BIGINT(10) UNSIGNED NOT NULL  , PRIMARY KEY (`id`)) ENGINE = InnoDB;

ALTER TABLE orders
ADD FOREIGN KEY(product_id)
REFERENCES products(id)
ON DELETE RESTRICT
ON UPDATE CASCADE;

SELECT cast(orders.timeAndDate as date) AS DATE, 
COUNT(*),SUM(products.price) AS SUM FROM `orders`,products 
WHERE orders.product_id = products.id GROUP BY 1


# Альберт, вынужден извинится за качество моих домашек
