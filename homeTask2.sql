MySQL


CREATE TABLE products (
  id       SERIAL        NOT NULL PRIMARY KEY,
  title    VARCHAR(127)  NOT NULL UNIQUE,
  vendor   INT           NOT NULL UNIQUE,
  img      VARCHAR(1023) NOT NULL,
  price    DOUBLE        NOT NULL,
  bringing TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  count    INT UNSIGNED  NULL,
  native   BOOLEAN       NOT NULL
);


INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Монитор', '123', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg',
   5000, NULL, 100, 1);

INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Клавиатура', '124', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg',
   500, 2017 - 04 - 05, 200, 1);

INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Мышка', '125', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg', 300,
   NULL, 300, 0);

INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Флешка', '126', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg', 500,
   NULL, 100, 0);

INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Наушники', '120', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg',
   5000, '2017-03-03 12:00', 100, 1)

Отрицательная цена
без ошибок
INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Камера', '127', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg', -500,
   NULL, 100, 0)

Наличие на складе меньше нуля
INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Микрофон', '128', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg',
   500, NULL, -1, 0)
Ответ MySQL:Документация
#1264 - Out OF range value FOR COLUMN 'count' at ROW 1

Пустой артикул
INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Микрофон', '', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg', 500,
   NULL, 100, 0)
Ответ MySQL:Документация
#1366 - Incorrect INTEGER value:'' FOR COLUMN 'vendor' at ROW 1

-------------------------------------------------------------------------------------------------
PostgreSQL


CREATE TABLE products (
  id       SERIAL        NOT NULL PRIMARY KEY,
  title    VARCHAR(127)  NOT NULL UNIQUE,
  vendor   INT           NOT NULL UNIQUE,
  img      VARCHAR(1023) NOT NULL,
  price    NUMERIC       NOT NULL,
  bringing TIMESTAMP     NOT NULL DEFAULT CURRENT_TIMESTAMP,
  count    INT           NULL,
  native   BOOLEAN       NOT NULL
);

INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Монитор', '123', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg',
   5000, '2017-04-05 12:00', 100, 't');

INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Клавиатура', '124', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg',
   500, '2017-04-05 13:10', 100, 'f');

INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Мышка', '124', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg', 500,
   '2017-04-05 13:10', 100, 'false');

INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Флешка', '126', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg', 1000,
   '2017-04-05 13:10:45', 300, 'true');


Отрицательная цена
без ошибок
INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Микрофон', '128', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg',
   -1000, '2017-04-05 13:10:45', 300, 'false');

Наличие на складе меньше нуля
без ошибок
INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Камера', '129', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg', 1000,
   '2017-04-05 13:10:45', -300, 'false');

Пустой артикул
INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Наушники', ' ', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg', 1000,
   '2017-04-05 13:10:45', 300, 'true');
ERROR:invalid input syntax FOR INTEGER :" "
SQL-состояние:22P02
Символ:94

----------------------------------------------------------------------------------------------------

SQLite


CREATE TABLE products (
  id       INTEGER PRIMARY KEY AUTOINCREMENT,
  title    TEXT NOT NULL UNIQUE,
  vendor   INT  NOT NULL UNIQUE,
  img      TEXT NOT NULL,
  price    REAL NOT NULL,
  bringing TEXT NOT NULL,
  count    INT  NULL,
  native   INT
);

INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Монитор', '123', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg',
   5000, '2017-04-03', 100, 1);

INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Клавиатура', '124', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg',
   500, '2017-04-03', 1000, 1);

INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Мышка', '125', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg', 500,
   '2017-04-05 13:10', 100, 'false');

INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Флешка', '126', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg', 500,
   '2017-04-04 12:05', 100, 0);

Отрицательная цена
без ошибок
INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Микрофон', '128', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg',
   -1000, '2017-04-05 13:10:45', 300, 'false');

Наличие на складе меньше нуля
без ошибок
INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Камера', '129', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg', 1000,
   '2017-04-05 13:10:45', -300, 'false');

Пустой артикул
без ошибок
INSERT INTO products (title, vendor, img, price, bringing, count, native) VALUES
  ('Наушники', '', 'http://st03.kakprosto.ru/tumb/680/images/article/2014/4/15/1_5353829b4177a5353829b417b8.jpg', 1000,
   '2017-04-05 13:10:45', 300, 'true');

