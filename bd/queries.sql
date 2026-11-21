-- 1 запрос для входа в приложение
SET NAMES utf8mb4;

SELECT u.id,
       CONCAT(u.last_name, ' ', u.first_name, ' ', u.middle_name) AS full_name,
       r.role_name AS role
FROM user u
JOIN role r ON r.id = u.id_role
WHERE u.Логин = '94d5ous@gmail.com'
  AND u.Пароль = 'uzWC67';
-- 2 запрос каталога товаров
SELECT p.id,
       p.aticul               AS article,
       pn.ProdName            AS name,
       p.Unit_measurement     AS unit,
       p.Price                AS price,
       p.Current_discount     AS discount,
       p.Quantity             AS stock_qty,
       p.Product_description  AS description,
       p.Photo                AS photo,
       c.name                 AS category,
       m.name                 AS manufacturer,
       s.name                 AS supplier
FROM prouducts p
JOIN prodname      pn ON pn.IdName = p.Product_name
JOIN categories    c  ON c.id     = p.Product_category
JOIN manufacturers m  ON m.id     = p.Manufacturer
JOIN suppliers     s  ON s.id     = p.Supplier;
-- 3поиск, фильтр и сортировк
SELECT p.id,
       p.aticul               AS article,
       pn.ProdName            AS name,
       p.Unit_measurement     AS unit,
       p.Price                AS price,
       p.Current_discount     AS discount,
       p.Quantity             AS stock_qty,
       p.Product_description  AS description,
       p.Photo                AS photo,
       c.name                 AS category,
       m.name                 AS manufacturer,
       s.name                 AS supplier
FROM prouducts p
JOIN prodname      pn ON pn.IdName = p.Product_name
JOIN categories    c  ON c.id     = p.Product_category
JOIN manufacturers m  ON m.id     = p.Manufacturer
JOIN suppliers    s  ON s.id     = p.Supplier
WHERE pn.ProdName LIKE CONCAT('%', 'Ботинки', '%')
  AND p.Supplier  = 1
ORDER BY p.Quantity DESC;

-- справочники для выпадающих списков в форме
SELECT id, name FROM categories;
SELECT id, name FROM manufacturers;
SELECT id, name FROM suppliers;
SELECT IdName AS id, ProdName AS name FROM prodname;

-- добавление товара 
INSERT INTO prouducts (
aticul,
Product_name,
Unit_measurement,
Price,
Supplier,
Manufacturer,
Product_category,
Current_discount,
Quantity,
Product_description,
Photo)
VALUES
    ('', 5, '', 44466.6 ,2 ,1 ,1 , 3,1006, '', '');
    
-- открыть товар для редактирования — заполнить все поля сразу
SELECT *
FROM prouducts
WHERE id = 1;

-- сохранить изменения
UPDATE prouducts
SET aticul            = 'F635R4',
Product_name        = 1,
Unit_measurement    = 'шт.',
Price            = 100000.2,
Supplier            = 2,
Manufacturer        = 2,
Product_category    = 1,
Current_discount    = 2,
Quantity            = 14,
Product_description = 'Ботинки Marco Tozzi женские демисезонные, размер 39, цвет бежевый',
Photo               = '2.jpg'
WHERE id = 2;
-- попытка удаления
DELETE FROM prouducts WHERE id = 1;