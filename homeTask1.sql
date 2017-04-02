MySQl
CREATE TABLE books (id SERIAL, title VARCHAR(127), created_at YEAR, author VARCHAR(127), price FLOAT);
CREATE TABLE publisher (id SERIAL, name VARCHAR(127), director VARCHAR(127));

SQLITE
CREATE TABLE books (id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT , created_at INTEGER, author TEXT, price NUMERIC);
CREATE TABLE publisher ( `id` INTEGER PRIMARY KEY AUTOINCREMENT , `name` TEXT, `director` TEXT)

Postgres
CREATE TABLE books (id SERIAL, title VARCHAR(127), created_at INTEGER, author VARCHAR(127), price FLOAT);
CREATE TABLE publisher (id SERIAL, name VARCHAR(127), director VARCHAR(127));


Запросы общие для трех СУБД
INSERT INTO books(title, author, created_at, price) VALUES('Вишневый сад', 'Чехов', 2015, 400);
INSERT INTO books(title, author, created_at, price) VALUES('Доктор Живаго', 'Пастернак', 2016, 700);
INSERT INTO books(title, author, created_at, price) VALUES('Ася', 'Тургенев', 2017, 500);
INSERT INTO books(title, author, created_at, price) VALUES('Дядя Ваня', 'Чехов', 1999, 600);
INSERT INTO books(title, author, created_at, price) VALUES('Три Сестры', 'Чехов', 1990, 500);

INSERT INTO publisher(name, director) VALUES('АБВ', 'Петров');
INSERT INTO publisher(name, director) VALUES('Новый Век', 'Иванова');

SELECT * FROM books WHERE author = 'Пастернак';
SELECT * FROM books WHERE price <= 500;
SELECT title, created_at FROM books WHERE author LIKE 'Чехов' ORDER BY 2;
SELECT DISTINCT author FROM books WHERE created_at BETWEEN 1990 AND 1999;




