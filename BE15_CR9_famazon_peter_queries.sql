-- Querry 1: how many different products are actually offer from company Rosenstengel?
SELECT COUNT(i.fk_supplier_id) FROM `items-stock` i
JOIN supplier s ON i.fk_supplier_id = s.supplier_id
WHERE s.name = "Rosenstengel"


-- Querry 2: what products with quantity are shipped between "2022-02-04" and "2022-03-01"?
SELECT p.name ,od.quantity
FROM orderdetails od JOIN `items-stock` i 
ON od.fk_item_id = i.item_id
JOIN products p on p.product_id = i.fk_product_id
WHERE od.fk_invoice_id in (
    SELECT s.fk_invoice_id FROM shipping s
    WHERE s.shippingDate BETWEEN "2022-02-04" and "2022-03-01")


-- Querry 3: how many products was delivered since 1st of March 22?
SELECT SUM(od.quantity)
FROM orderdetails od JOIN `items-stock` i 
ON od.fk_item_id = i.item_id
JOIN supplier s on s.supplier_id = i.fk_supplier_id
WHERE od.fk_invoice_id in (
    SELECT s.fk_invoice_id FROM shipping s
    WHERE s.deliveryDate BETWEEN "2022-03-01" and CURRENT_DATE)


-- Querry 4: how much are the total for orders from customer "Jenny TestChar"?
SELECT SUM(od.quantity * i.price) 
FROM orderdetails od 
JOIN `items-stock` i ON od.fk_item_id = i.item_id
WHERE od.fk_order_id in (
	SELECT o.order_id from `order` o
	JOIN customer c ON c.userName = o.fk_userName
    WHERE c.firstName = "Jenny" AND c.lastName = "TestChar")


-- Querry 5: which products was delivered to "Salzburg"?
SELECT p.name FROM shipping s
JOIN invoice iv on iv.invoice_id = s.fk_invoice_id
JOIN orderdetails od on od.fk_invoice_id = iv.invoice_id
JOIN `order` o on o.order_id = od.fk_invoice_id
JOIN customer c on o.fk_userName = c.userName
JOIN area a on c.fk_zip = a.zip
JOIN `items-stock` i on i.item_id = od.fk_item_id
JOIN products p on p.product_id = i.fk_product_id
WHERE a.city = "Salzburg"


