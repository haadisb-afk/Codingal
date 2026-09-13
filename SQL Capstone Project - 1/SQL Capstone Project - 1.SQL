CREATE TABLE IF NOT EXISTS Salesman(
  Salesman_id TEXT PRIMARY KEY,
  name TEXT,
  city TEXT,
  Comission TEXT
);
INSERT INTO Salesman(Salesman_id, name, city, Comission) 
VALUES
  ('5001', 'James Hoog', 'New York', '0.15'),
  ('5002', 'Nail Knite', 'Paris', '0.13'),
  ('5005', 'Pit Alex', 'London', '0.11'),
  ('5006', 'Mc Lyon', 'Paris', '0.14'),
  ('5007', 'Paul Adam', 'Rome', '0.13'),
  ('5003', 'Lauson Hen', 'San Jose', '0.12');

CREATE TABLE IF NOT EXISTS Customer(
  customer_id TEXT,
  cust_name TEXT PRIMARY KEY,
  city TEXT,
  grade TEXT,
  Salesman_id TEXT
);
INSERT INTO Customer(customer_id, cust_name, city, grade, Salesman_id)
VALUES
  ('3002', 'Alfreds Futterkiste', 'Berlin', '2', '5001'),
  ('3007', 'Berglunds snabbkop', 'Lulea', '3', '5002'),
  ('3005', 'Island Trading', 'Cowes', '3', '5005'),
  ('3006', 'Koning, Johanna', 'Amsterdam', '2', '5006'),
  ('3008', 'Laughing Bacchus Winecellars', 'Vancouver', '3', '5007'),
  ('3001', 'Magazzini Alimentari Riuniti', 'Bergamo', '1', '5003');

CREATE TABLE IF NOT EXISTS Orders(
  ord_no TEXT PRIMARY KEY,
  purch_amt TEXT,
  ord_date TEXT,
  customer_id TEXT,
  Salesman_id TEXT
);
INSERT INTO Orders(ord_no, purch_amt, ord_date, customer_id, Salesman_id)
VALUES
  ('70001', '150.5', '2012-10-05', '3005', '5005'),
  ('70009', '270.65', '2012-09-10', '3001', '5003'),
  ('70002', '65.26', '2012-10-05', '3002', '5001'),
  ('70004', '110.5', '2012-08-17', '3007', '5002'),
  ('70007', '948.5', '2012-09-10', '3008', '5007'),
  ('70005', '2400.6', '2012-07-27', '3006', '5006');

SELECT customer.cust_name, salesman.name, salesman.city
FROM customer
JOIN salesman ON customer.city = salesman.city

SELECT customer.cust_name, salesman.name
FROM customer
JOIN salesman ON customer.Salesman_id = salesman.Salesman_id

SELECT Orders.ord_no, Customer.cust_name, Orders.purch_amt, Orders.ord_date
FROM Orders
JOIN Customer ON Orders.customer_id = Customer.customer_id
JOIN Salesman ON Orders.Salesman_id = Salesman.Salesman_id
WHERE Customer.city <> Salesman.city

SELECT Orders.ord_no, Customer.cust_name
FROM Orders
JOIN Customer ON Orders.customer_id = Customer.customer_id

SELECT Customer.cust_name AS "Customer", Customer.grade AS "Grade", Salesman.name AS "Salesman", Salesman.Comission AS "Comission"
FROM Orders
JOIN Salesman ON Orders.Salesman_id = Salesman.Salesman_id
JOIN Customer ON Orders.customer_id = Customer.customer_id
WHERE Customer.grade IS NOT NULL;

SELECT Customer.cust_name AS "Customer",
Customer.city AS "City"
Salesman.name AS "Salesman",
Salesman.Comission
FROM Customer
JOIN Salesman ON Customer.Salesman_id = Salesman.Salesman_id
WHERE Salesman.Comission BETWEEN 0.12 AND 0.14;

SELECT Orders.ord_no AS "Order Number", Orders.purch_amt AS "Purchase Amount", Orders.ord_date AS "Order Date", Customer.cust_name AS "Customer Name", Salesman.name AS "Salesman Name"
Orders.purch_amt * Salesman.Comission AS "Commission Amount"
FROM Orders
JOIN Salesman ON Orders.Salesman_id = Salesman.Salesman_id
JOIN Customer ON Orders.customer_id = Customer.customer_id
WHERE Customer.grade >= 200;

SELECT *
FROM Customer
JOIN Orders ON Customer.customer_id = Orders.customer_id
WHERE Orders.ord_date = '2012-10-05';