# 1 
SELECT orderNumber AS Orden, sum(quantityOrdered) AS Productos
FROM orderdetails
GROUP BY orderNumber;
# 2
SELECT d.orderNumber, o.status, sum((d.quantityOrdered * d.priceEach))AS total 
FROM orderdetails AS d
JOIN orders AS o
ON d.orderNumber = o.orderNumber
GROUP BY orderNumber; 
# 3 
SELECT d.orderNumber, o.orderDate, p.productName, d.quantityOrdered, d.priceEach
FROM orderdetails AS d
JOIN orders AS o 
ON d.orderNumber = o.orderNumber
JOIN products AS p
ON d.productCode = p.productCode;
# 4 
SELECT d.orderNumber, p.productName, p.MSRP, d.priceEach
FROM orderdetails AS d
JOIN products AS p
ON d.productCode = p.productCode; 
# 5 
SELECT c.customerNumber, c.customerName, o.orderNumber, o.status 
FROM customers AS c
LEFT JOIN orders AS o
ON c.customerNumber = o.customerNumber;
# Hacer un left join nos puede ayudar para ver qué clienetes aún no realizan compras
# 6 
SELECT c.customerName, o.orderNumber
FROM customers AS c
LEFT JOIN orders AS o
ON c.customerNumber = o.CustomerNumber
WHERE orderNumber IS NULL;
# 7 
SELECT concat (e.lastName, ' ', e.firstName) AS employee, c.customerName, p.checkNumber, p.amount
FROM customers AS c 
LEFT JOIN payments AS p
ON c.customerNumber = p.customerNumber
LEFT JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber;
# 8 (1)
SELECT c.customerNumber, c.customerName, o.orderNumber, o.status 
FROM customers AS c
RIGHT JOIN orders AS o
ON c.customerNumber = o.customerNumber;
-- Esta es totalmente diferente; aquí necesariamente muestro a los clientes que han realizado una compra --
# 8 (2) 
 SELECT c.customerName, o.orderNumber
FROM customers AS c
RIGHT JOIN orders AS o
ON c.customerNumber = o.CustomerNumber
WHERE orderNumber IS NULL;
-- Aquí es totalmente a la inversa. En vez de elegir a las personas que no tienen cuenta, se eligen a las que sí. Por tanto, no tentré resultados de gente que no tenga cuenta en esta tabla --
# 8 (3)
SELECT concat (e.lastName, ' ', e.firstName) AS employee, c.customerName, p.checkNumber, p.amount
FROM customers AS c 
RIGHT JOIN payments AS p
ON c.customerNumber = p.customerNumber
RIGHT JOIN employees AS e
ON c.salesRepEmployeeNumber = e.employeeNumber;
-- Como aquí me centro en los empleados en vez de los clientes, también tengo los resultados de aquellos empleados que no tiene clientes asignados
# 9 
CREATE VIEW prueba_745 AS (SELECT d.orderNumber, p.productName, p.MSRP, d.priceEach
FROM orderdetails AS d
JOIN products AS p
ON d.productCode = p.productCode);
-- No tenemos permiso para crear vistas, pero dejé el codigo-- 