--Beginner Level
--Find the total number of customers in the customers table.
select count(*)as total_customers
from customers;

--Find the total number of products in the products table.
select count(*)as total_products
from products;

--Show all customers who live in Mumbai.
select * 
from customers
where city='Mumbai';

--List all products with price greater than 500.
select *
from products
where price>500;

--Find the number of products in each category.
select category_id,count(*)as total_product
from products
group by category_id;

--Display all orders placed after 01-JAN-2024.
select * 
from orders
where order_date>'01-JAN-2024';

--Find the total number of orders placed by each customer.
select customer_id,count(*)total_orders
from orders
group by customer_id;

--Show all products belonging to category_id = 5.
select * 
from products
where category_id=5;

--Find the average price of all products.
select avg(price)as avg_products
from products;

--Display the total quantity sold from the order_items table.
select sum(quantity)as total_quantity
from order_items;

