-- Querry 1: how many different products are actually offer from company Rosenstengel
SELECT COUNT(i.fk_supplier_id) FROM `items-stock` i
JOIN supplier s ON i.fk_supplier_id = s.supplier_id
WHERE s.name = "Rosenstengel"


-- Querry 2: what products with quantity are shipped between "2022-02-04" and "2022-03-01"
SELECT p.name ,od.quantity
FROM orderdetails od JOIN `items-stock` i 
ON od.fk_item_id = i.item_id
JOIN products p on p.product_id = i.fk_product_id
WHERE od.fk_invoice_id in (
    SELECT s.fk_invoice_id FROM shipping s
    WHERE s.shippingDate BETWEEN "2022-02-04" and "2022-03-01")


-- Querry 3: how many products was delivered since 1st of March 22
SELECT SUM(od.quantity)
FROM orderdetails od JOIN `items-stock` i 
ON od.fk_item_id = i.item_id
JOIN supplier s on s.supplier_id = i.fk_supplier_id
WHERE od.fk_invoice_id in (
    SELECT s.fk_invoice_id FROM shipping s
    WHERE s.deliveryDate BETWEEN "2022-03-01" and CURRENT_DATE)

    