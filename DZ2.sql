-- 1. Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными. 

CREATE DATABASE IF NOT EXISTS DZ2;

USE DZ2;

CREATE TABLE IF NOT EXISTS `DZ2`.`telephon` (
  `Id` INT NOT NULL AUTO_INCREMENT,
  `ProductName` VARCHAR(45) NOT NULL,
  `Manufacturer` VARCHAR(45) NULL,
  `ProductCount` DOUBLE NULL,
  `Price` DOUBLE NULL,
  PRIMARY KEY (`Id`));

INSERT telephon(ProductName, Manufacturer, ProductCount, Price) 
VALUES 
('iPhone X', 'Apple', 3, 76000),
('iPhone 8', 'Apple', 2, 51000),
('Galaxy S9', 'Samsung', 2, 56000),
('Galaxy S8', 'Samsung', 1, 41000),
('P20 Pro', 'Huawei', 5, 36000);

-- 2. Выведите название, производителя и цену для товаров, количество которых превышает 2 

SELECT ProductName, Manufacturer, Price
FROM telephon
WHERE ProductCount > 2; 

-- 3. Выведите весь ассортимент товаров марки “Samsung”
SELECT *
FROM telephon
WHERE Manufacturer = 'Samsung';

-- 4. Выведите информацию о телефонах, где суммарный чек больше 100 000 и меньше 145 000**
SELECT *
FROM telephon
WHERE ProductCount * Price > 100000 AND
	ProductCount * Price < 145000;

-- 4.1 Товары, в которых есть упоминание "Iphone"    
SELECT *
FROM telephon
WHERE ProductName LIKE '%Iphone%';

-- 4.2 Товары, в которых есть упоминание "Galaxy"
SELECT *
FROM telephon
WHERE ProductName LIKE '%Galaxy%';

-- 4.3 Товары, в которых есть ЦИФРЫ
SELECT *
FROM telephon
WHERE ProductName RLIKE '[:digit:]';

-- 4.4 Товары, в которых есть ЦИФРА "8"  
SELECT *
FROM telephon
WHERE ProductName RLIKE '8';
 72 changes: 72 additions & 0 deletions72  
sql_2/DZ2.sql
@@ -0,0 +1,72 @@
DROP DATABASE IF EXISTS DZ2;

CREATE DATABASE IF NOT EXISTS DZ2;

USE DZ2;

-- 1. Используя операторы языка SQL, создайте таблицу “sales”. Заполните ее данными.

CREATE TABLE IF NOT EXISTS sales
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    count_product INT NOT NULL
);

INSERT INTO sales(order_date, count_product)
VALUES
	(DATE '2022-01-01', 156),
	(DATE '2022-01-02', 180),
	(DATE '2022-01-03', 21),
	(DATE '2022-01-04', 124),
	(DATE '2022-01-05', 341);

/*
2.  Для данных таблицы “sales” укажите тип заказа в зависимости от кол-ва : 
меньше 100  -    Маленький заказ
от 100 до 300 - Средний заказ
больше 300  -     Большой заказ
*/

SELECT 
	id,
    CASE
		WHEN count_product < 100 THEN "Маленький заказ"
        WHEN count_product BETWEEN 100 AND 300 THEN "Средний заказ"
        ELSE "Большой заказ"
    END AS "Тип заказа"
FROM sales;

-- 3. Создайте таблицу “orders”, заполните ее значениями
CREATE TABLE IF NOT EXISTS orders
(
	id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id VARCHAR(20),
    amount FLOAT DEFAULT 0.0,
	order_status VARCHAR(20)
);

INSERT INTO orders (employee_id, amount, order_status)
VALUES
('s03', 15.00, "OPEN"),
('e01', 25.50, "OPEN"),
('e05', 100.70, "CLOSED"),
('e02', 22.18, "OPEN"),
('e04', 9.50, "CANCELLED");

SELECT
	id,
    employee_id,
    amount,
    order_status,
	CASE
		WHEN order_status = "OPEN" THEN "Order is in open state"
        WHEN order_status = "CLOSED" THEN "Order is closed"
        WHEN order_status = "CANCELLED" THEN "Order is cancelled"
        ELSE ""
    END AS full_order_status
FROM orders;


