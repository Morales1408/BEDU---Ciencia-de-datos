# 1 
SELECT employeeNumber, lastName, firstName FROM employees
WHERE firstName LIKE 'A%';
# 2
SELECT employeeNumber, lastName, firstName FROM employees
WHERE lastName LIKE '%on';
# 3 
SELECT employeeNumber, lastName, firstName FROM employees
WHERE lastName LIKE '%on%';
# 4 
SELECT employeeNumber, lastName, firstName FROM employees
WHERE firstName LIKE 'G_____';
# 5 
SELECT employeeNumber, lastName, firstName FROM employees
WHERE firstName NOT LIKE 'B%';
# 6 
SELECT productCode, productName FROM products
WHERE productCode LIKE '%\_20%';
# 7 
SELECT sum(quantityOrdered * priceEach) AS total, orderNumber
FROM orderdetails 
GROUP BY orderNumber;
# 8 
SELECT count(*) AS total, YEAR(orderDate) AS Year FROM orders
GROUP BY YEAR(orderDate);
# 9 
SELECT CONCAT(firstName, ' ', lastName) AS Nombre, officeCode
FROM employees
WHERE officeCode IN (SELECT officeCode from offices
WHERE country = 'USA');
# 10 
SELECT customerNumber, checkNumber, amount FROM payments 
WHERE amount = (SELECT MAX(amount) FROM payments);
# 11
SELECT customerNumber, checkNumber, amount FROM payments
WHERE amount > (SELECT AVG(amount)FROM payments);
# 12
SELECT customerName FROM customers
WHERE customerNumber NOT IN (SELECT customerNumber FROM orders);
# 13
SELECT (SELECT max(quantityOrdered) FROM orderdetails) AS Maximo, 
(SELECT min(quantityOrdered) FROM orderdetails) AS Minimo, 
(SELECT avg(quantityOrdered) FROM orderdetails) AS Promedio;
# 14 
SELECT count(*) AS total, status FROM orders
GROUP BY status;