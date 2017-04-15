MySQL

CREATE TABLE products
(
  id       INT          NOT NULL auto_increment
  PRIMARY KEY,
  vendor   VARCHAR(255) NOT NULL,
  name     VARCHAR(127) NULL,
  price    INT          NOT NULL,
  oldPrice INT          NULL,
  img      VARCHAR(255) NULL,
  bringing timestamp DEFAULT CURRENT_TIMESTAMP NOT NULL,
  counts   INT          NULL,
  CONSTRAINT products_vendor_uindex
  UNIQUE (vendor),
  CONSTRAINT products_name_uindex
  UNIQUE (name)
);

CREATE INDEX products_price_index
  ON products (price);


SELECT *
FROM `products`
ORDER BY bringing
  DESC
LIMIT 10;

SELECT *
FROM `products`
ORDER BY price
LIMIT 10;

SELECT
  name,
  price - oldPrice
FROM `products`
ORDER BY (price - oldPrice)
  DESC
LIMIT 10;

SELECT *
FROM products
WHERE vendor LIKE 'Test%';


_-------------------------------------------------------------------------------------
Sqlite

CREATE TABLE products
(
  id       INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
  vendor   TEXT                              NOT NULL,
  name     TEXT                              NOT NULL,
  price    INT                               NOT NULL,
  oldPrice INT,
  img      TEXT,
  bringing TEXT,
  count    INT
);
CREATE UNIQUE INDEX products_vendor_uindex
  ON products (vendor);
CREATE UNIQUE INDEX products_id_uindex
  ON products (id);


SELECT *
FROM products
ORDER BY date(bringing)
  DESC
LIMIT 10;

SELECT *
FROM products
ORDER BY price
LIMIT 10;

SELECT
  name,
  price - oldPrice
FROM `products`
ORDER BY (price - oldPrice)
  DESC
LIMIT 10;

SELECT *
FROM products
WHERE vendor LIKE 'Test%';

---------------------------------------------------------------------------------------
*
//Единственное что пришло в голову

<?php

try {
$dbh = new PDO(
'mysql:dbname=DBA;host=127.0.0.1',
'root',
'321',
[
PDO::MYSQL_ATTR_INIT_COMMAND => 'SET NAMES utf8',
]);

} catch (PDOException $e) {
echo $e->getMessage();
}

$table = 'products';

$i = 0;
while ($i < 1000) {
//choosing vendor's name
    if ($i % 3 == 0) {
        $vendor = 'Test' . $i;
    } else {
        $vendor = 100 + $i;
    }
    $name = 'Product' . $i;
    $price = mt_rand(1000, 5000);
    $oldPrice = $price - mt_rand(100, 500);
    $img = 'https://www.dreamstime.com/stock-photo-basket-goods-image26388700';
    //products receiving
    $bringing = '2017-' . mt_rand(1, 12) . '-' . mt_rand(1, 29);
    $count = mt_rand(0, 100);
    $ith = $dbh->prepare(' INSERT INTO ' . $table . '
VALUES (NULL, :vendor, :name, :price, :oldPrice, :img, :bringing, :counts)');
    $ith->execute([':vendor' => $vendor, ':name' => $name, ':price' => $price, ':oldPrice' => $oldPrice, ':img' => $img, ':bringing' => $bringing, ':counts' => $count]);
    $i++;
}

