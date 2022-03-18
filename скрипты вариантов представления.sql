USE my_shop;

#просмотр количества продуктов на складе
DROP VIEW IF EXISTS view_quantity;
CREATE VIEW view_quantity (`id склада`, `id продукта`, `кол-во`) AS SELECT storehouse_id , product_id, value
FROM storehouses_products ORDER BY value;
SELECT * FROM view_quantity;


#просмотр продаж за неделю
DROP VIEW IF EXISTS sold_to_week;
CREATE VIEW sold_to_week AS SELECT * FROM logs WHERE updated_at > (NOW() - INTERVAL 7 DAY);
SELECT * FROM sold_to_week;



