--Advanced Level
--Find customers who never placed an order.
select c.customer_id,o.order_id
from customers c 
left join orders o on
c.customer_id=o.customer_id
where o.order_id is null;

select *
from customers
where customer_id not in(
        select customer_id
        from orders);

--Find products that were never sold.
select * 
from products
where product_id not in(
        select product_id
        from order_items);
        
select *
from products p
where  not exists(
        select 1
        from order_items oi
        where oi.product_id=p.product_id);

--Calculate revenue by category.
select c.category_name,sum(oi.quantity*oi.price)as revenue
from categories c
join products p on
c.category_id=p.category_id
join order_items oi on
p.product_id=oi.product_id
group by c.category_name
order by revenue desc;


--Find the top 3 customers based on total spending.
select c.customer_id, sum(oi.quantity*oi.price) as total_spending
from customers c
join orders o on 
c.customer_id=o.customer_id
join order_items oi on
o.order_id=oi.order_id
group by c.customer_id
order by total_spending desc
fetch first 3 rows only;


--Rank products based on total sales.
SELECT 
    p.product_id,
    p.product_name,
    SUM(oi.quantity * oi.price) AS total_sales,
    dense_RANK() OVER (ORDER BY SUM(oi.quantity * oi.price) DESC) AS sales_rank
FROM products p
JOIN order_items oi 
    ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name;

--Find the most reviewed products.
select p.product_name,count(r.review_id)as most_review
from products p
join reviews r on 
p.product_id=r.product_id
group by p.product_name
order by most_review;

--Find the highest revenue generating product.
select p.product_name,sum(oi.quantity*oi.price)as revenue
from products p
join order_items oi on
p.product_id=oi.product_id
group by p.product_name
order by revenue desc
fetch first 1 rows only;

select *
from(
select p.product_name,sum(oi.quantity*oi.price)as revenue,
dense_rank() over(order by sum(oi.quantity*oi.price) desc)as rnk
from products p
join order_items oi on
p.product_id=oi.product_id
group by p.product_name
)
where rnk=1;

--Calculate monthly revenue from orders.
select to_char(o.order_date,'yyyy-mm')as month,
from orders o 
join order_items oi on
o.order_id=oi.order_id
group by to_char(o.order_date,'yyyy-mm')
order by month;

--Find customers who placed more than 5 orders.
select c.customer_id,c.first_name,count(o.order_id)as total_orders
from customers c
join orders o
    on c.customer_id=o.customer_id
    group by c.customer_id,c.first_name
    having count(o.order_id)>5;
    
select customer_id,count(order_id)as total_orders
from orders
group by customer_id
having count(order_id)>5;

--Find the average order value.
select avg(total_revenue)as avg_order_value
from(
select o.order_id, sum(oi.quantity*oi.price)as total_revenue
from orders o
join order_items oi
on o.order_id=oi.order_id
group by o.order_id
);

