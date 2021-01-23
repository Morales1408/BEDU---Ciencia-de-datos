# 1
USE classicmodels;
# 2 
SELECT lastName FROM employees; 
# 3 
SELECT lastName, firstName, jobTitle FROM employees; 
# 4
SELECT * FROM employees;
# 5
SELECT lastName, firstName, jobTitle FROM employees
WHERE jobTitle = 'Sales Rep';
# 6
SELECT lastName, firstName, jobTitle, officeCode FROM employees
WHERE jobTitle = 'Sales Rep'
AND officeCode = 1;
# 7
SELECT lastName, firstName, jobTitle, officeCode FROM employees
WHERE jobTitle = 'Sales Rep'
OR officeCode = 1;
# 8 
SELECT lastName, firstName, officeCode FROM employees
WHERE officeCode IN (1,2,3);
# 9 
SELECT lastName, firstName, jobTitle FROM employees
WHERE jobTitle <> 'Sales Rep';
# 10
SELECT lastName, firstName, officeCode FROM employees
WHERE officeCode > 5;
# 11
SELECT lastName, firstName, officeCode FROM employees
WHERE officeCode <= 4;
# 12
SELECT customerName, country, state FROM customers
WHERE country = 'USA'
AND state = 'CA';
# 13 
SELECT customerName, country, state, creditLimit FROM customers
WHERE country = 'USA'
AND state = 'CA'
AND creditLimit > 100000;
# 14
SELECT customerName, country FROM customers 
WHERE country IN ('USA','France');
# 15 
SELECT customerName, country, creditLimit FROM customers
WHERE country IN ('USA','France')
AND creditLimit > 100000;
#16
SELECT officeCode, city, phone, country FROM offices
WHERE country IN ('USA','France');
# 17 
SELECT officeCode, city, phone, country FROM offices
WHERE country NOT IN ('USA','France');
# 18 
SELECT orderNumber, customerNumber, status, shippedDate FROM orders
WHERE orderNumber IN (10165, 10287, 10310);
# 19 
SELECT contactLastName, customerName FROM customers
ORDER BY contactLastName ASC;
# 20 
SELECT contactLastName, customerName FROM customers
ORDER BY contactLastName DESC;
# 21 
SELECT contactLastName, customerName FROM customers
ORDER BY contactLastName DEsC, customerName ASC; 
# 22 
SELECT customerNumber, customerName, creditLimit FROM customers
ORDER BY creditLimit DESC
LIMIT 5;
# 23 
SELECT customerNumber, customerName, creditLimit FROM customers
WHERE creditLimit != 0 
ORDER BY creditLimit ASC
LIMIT 5;