--Intermediate Level
--List customers and their orders using JOIN.
select c.customer_id,c.first_name,o.order_id
from customers c
join orders o on
c.customer_id=o.customer_id;

--Find the total revenue generated from all orders.
select p.product_name,
    sum(o.quantity)as total_reve
from products p
join order_items o on
p.product_id=o.product_id
group by p.product_name;

--Show the total quantity sold for each product.
select p.product_name,sum(o.quantity)as total_quantity
from products p
join order_items o on
p.product_id=o.product_id
group by p.product_name;

--Find the top 5 most sold products.
select product_name,price
from(
    select product_name,price,rank() over(order by price desc)as rnk
    from products)
where rnk<6;

--Calculate the total amount spent by each customer.
select c.customer_id,sum(oi.quantity * oi.price)as total_amount
from customers c
join orders o on
c.customer_id=o.customer_id
join order_items oi on
o.order_id=oi.order_id
group by c.customer_id;

--Find the number of orders placed in each city.
select c.city,count(o.order_id)as number_of_order
from customers c
join orders o on
c.customer_id=o.customer_id
group by city;

--Display products along with their category names.
select p.product_name,c.category_name
from products p
join categories c on
p.category_id=c.category_id;

--Find the average rating for each product.
select p.product_id,avg(r.rating)as avg_rating
from products p
join reviews r on
p.product_id=r.product_id
group by p.product_id;

--Show orders along with payment method and payment amount.
select p.order_id,p.payment_method,oi.price
from payments p
join orders o on
p.order_id=o.order_id
join order_items oi on
oi.order_id=o.order_id;

--Find the total number of reviews for each product.
select p.product_name,count(r.review_id)as total_review
from products p
join reviews r on
p.product_id=r.product_id
group by p.product_name;