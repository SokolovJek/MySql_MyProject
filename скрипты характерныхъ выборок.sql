USE my_shop;
# Вложений запрос на вывод пользователей сделавших больше 2х заказов 
SELECT id, firstname, lastname FROM users
WHERE id IN (SELECT user_id FROM orders GROUP BY user_id HAVING COUNT(user_id) >=2);

#Показать каких продуктов больше всего на складе
SELECT p.name, sp.id AS id_product, sp.value AS value, s.name AS adres FROM
storehouses_products AS sp 
JOIN 
storehouses AS s
ON s.id = sp.storehouse_id
JOIN
products AS p 
ON sp.product_id = p.id
where sp.value > 7;
