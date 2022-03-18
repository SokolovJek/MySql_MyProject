USE my_shop; 

DROP TABLE IF EXISTS logs;
create table logs(
	products_id INT COMMENT 'id продукта',
	value INT COMMENT 'поле остаток на складе',
	updated_at DATETIME DEFAULT CURRENT_TIMESTAMP
	) COMMENT = 'журанал обновления storehouses_products' ENGINE=Archive;


DROP TRIGGER IF EXISTS update_storehouses_products;
DELIMITER //;
CREATE TRIGGER update_storehouses_products AFTER UPDATE ON storehouses_products
FOR EACH ROW BEGIN 
	INSERT INTO logs (products_id, value) 
	VALUES(NEW.product_id, NEW.value);
END//
DELIMITER `;`;


UPDATE storehouses_products
SET value=7
WHERE product_id=20;

SELECT * FROM logs;