
CREATE TABLE categories (
    category_id NUMBER PRIMARY KEY,
    category_name VARCHAR2(50)
);

CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100),
    category_id NUMBER,
    price NUMBER(10,2),
    
    CONSTRAINT fk_product_category
    FOREIGN KEY (category_id)
    REFERENCES categories(category_id)
);

CREATE TABLE customers (
    customer_id NUMBER PRIMARY KEY,
    first_name VARCHAR2(50),
    last_name VARCHAR2(50),
    email VARCHAR2(100),
    city VARCHAR2(50),
    created_date DATE
);

CREATE TABLE orders (
    order_id NUMBER PRIMARY KEY,
    customer_id NUMBER,
    order_date DATE,
    status VARCHAR2(20),

    CONSTRAINT fk_orders_customer
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    product_id NUMBER,
    quantity NUMBER,
    price NUMBER(10,2),

    CONSTRAINT fk_orderitems_order
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    CONSTRAINT fk_orderitems_product
    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id NUMBER PRIMARY KEY,
    order_id NUMBER,
    payment_date DATE,
    payment_method VARCHAR2(20),

    CONSTRAINT fk_payment_order
    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
);

CREATE TABLE reviews (
    review_id NUMBER PRIMARY KEY,
    product_id NUMBER,
    customer_id NUMBER,
    rating NUMBER,
    review_date DATE,

    CONSTRAINT fk_review_product
    FOREIGN KEY (product_id)
    REFERENCES products(product_id),

    CONSTRAINT fk_review_customer
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);













CREATE TABLE products (
    product_id NUMBER PRIMARY KEY,
    product_name VARCHAR2(100),
    category VARCHAR2(50),
    price NUMBER(10,2),
    quantity NUMBER,
    created_date DATE
);

INSERT INTO categories VALUES (1,'Electronics');
INSERT INTO categories VALUES (2,'Mobiles');
INSERT INTO categories VALUES (3,'Laptops');
INSERT INTO categories VALUES (4,'Clothing');
INSERT INTO categories VALUES (5,'Shoes');
INSERT INTO categories VALUES (6,'Furniture');
INSERT INTO categories VALUES (7,'Kitchen');
INSERT INTO categories VALUES (8,'Books');
INSERT INTO categories VALUES (9,'Sports');
INSERT INTO categories VALUES (10,'Beauty');
INSERT INTO categories VALUES (11,'Toys');
INSERT INTO categories VALUES (12,'Stationery');
INSERT INTO categories VALUES (13,'Watches');
INSERT INTO categories VALUES (14,'Accessories');
INSERT INTO categories VALUES (15,'Bags');
INSERT INTO categories VALUES (16,'Home Decor');
INSERT INTO categories VALUES (17,'Gaming');
INSERT INTO categories VALUES (18,'Cameras');
INSERT INTO categories VALUES (19,'Fitness');
INSERT INTO categories VALUES (20,'Groceries');
INSERT INTO categories VALUES (21,'Pet Supplies');
INSERT INTO categories VALUES (22,'Music');
INSERT INTO categories VALUES (23,'Office');
INSERT INTO categories VALUES (24,'Garden');
INSERT INTO categories VALUES (25,'Lighting');
INSERT INTO categories VALUES (26,'Baby Products');
INSERT INTO categories VALUES (27,'Health');
INSERT INTO categories VALUES (28,'Car Accessories');
INSERT INTO categories VALUES (29,'Bike Accessories');
INSERT INTO categories VALUES (30,'Smart Home');
INSERT INTO categories VALUES (31,'Tools');
INSERT INTO categories VALUES (32,'Travel');
INSERT INTO categories VALUES (33,'Jewellery');
INSERT INTO categories VALUES (34,'Sunglasses');
INSERT INTO categories VALUES (35,'Crafts');
INSERT INTO categories VALUES (36,'Software');
INSERT INTO categories VALUES (37,'Hardware');
INSERT INTO categories VALUES (38,'Networking');
INSERT INTO categories VALUES (39,'Security');
INSERT INTO categories VALUES (40,'Outdoor');
INSERT INTO categories VALUES (41,'Education');
INSERT INTO categories VALUES (42,'DIY');
INSERT INTO categories VALUES (43,'Art');
INSERT INTO categories VALUES (44,'Party Supplies');
INSERT INTO categories VALUES (45,'Cleaning');
INSERT INTO categories VALUES (46,'Laundry');
INSERT INTO categories VALUES (47,'Food Storage');
INSERT INTO categories VALUES (48,'Dining');
INSERT INTO categories VALUES (49,'Bed & Bath');
INSERT INTO categories VALUES (50,'Mattress');

select * from categories;


INSERT INTO customers VALUES (1,'Rahul','Sharma','rahul1@mail.com','Mumbai',DATE '2024-01-01');
INSERT INTO customers VALUES (2,'Amit','Patil','amit2@mail.com','Pune',DATE '2024-01-02');
INSERT INTO customers VALUES (3,'Rohit','Jadhav','rohit3@mail.com','Nagpur',DATE '2024-01-03');
INSERT INTO customers VALUES (4,'Suresh','More','suresh4@mail.com','Nashik',DATE '2024-01-04');
INSERT INTO customers VALUES (5,'Vikas','Kale','vikas5@mail.com','Thane',DATE '2024-01-05');
INSERT INTO customers VALUES (6,'Ajay','Patel','ajay6@mail.com','Surat',DATE '2024-01-06');
INSERT INTO customers VALUES (7,'Ramesh','Gupta','ramesh7@mail.com','Delhi',DATE '2024-01-07');
INSERT INTO customers VALUES (8,'Anil','Singh','anil8@mail.com','Lucknow',DATE '2024-01-08');
INSERT INTO customers VALUES (9,'Deepak','Yadav','deepak9@mail.com','Kanpur',DATE '2024-01-09');
INSERT INTO customers VALUES (10,'Kiran','Naik','kiran10@mail.com','Goa',DATE '2024-01-10');
INSERT INTO customers VALUES (11,'Pooja','Shah','pooja11@mail.com','Mumbai',DATE '2024-01-11');
INSERT INTO customers VALUES (12,'Neha','Kulkarni','neha12@mail.com','Pune',DATE '2024-01-12');
INSERT INTO customers VALUES (13,'Priya','Joshi','priya13@mail.com','Nagpur',DATE '2024-01-13');
INSERT INTO customers VALUES (14,'Sneha','Patil','sneha14@mail.com','Kolhapur',DATE '2024-01-14');
INSERT INTO customers VALUES (15,'Asha','Deshmukh','asha15@mail.com','Aurangabad',DATE '2024-01-15');
INSERT INTO customers VALUES (16,'Meena','Kadam','meena16@mail.com','Satara',DATE '2024-01-16');
INSERT INTO customers VALUES (17,'Seema','Pawar','seema17@mail.com','Solapur',DATE '2024-01-17');
INSERT INTO customers VALUES (18,'Ritu','Verma','ritu18@mail.com','Delhi',DATE '2024-01-18');
INSERT INTO customers VALUES (19,'Anita','Shinde','anita19@mail.com','Pune',DATE '2024-01-19');
INSERT INTO customers VALUES (20,'Swati','More','swati20@mail.com','Nashik',DATE '2024-01-20');



INSERT INTO products VALUES (1,'Samsung TV',1,45000);
INSERT INTO products VALUES (2,'iPhone 14',2,80000);
INSERT INTO products VALUES (3,'Dell Laptop',3,65000);
INSERT INTO products VALUES (4,'Men T-Shirt',4,900);
INSERT INTO products VALUES (5,'Nike Shoes',5,4000);
INSERT INTO products VALUES (6,'Wooden Sofa',6,25000);
INSERT INTO products VALUES (7,'Mixer Grinder',7,3000);
INSERT INTO products VALUES (8,'Java Book',8,700);
INSERT INTO products VALUES (9,'Cricket Bat',9,1500);
INSERT INTO products VALUES (10,'Face Cream',10,500);
INSERT INTO products VALUES (11,'Toy Car',11,600);
INSERT INTO products VALUES (12,'Notebook',12,80);
INSERT INTO products VALUES (13,'Casio Watch',13,2500);
INSERT INTO products VALUES (14,'Leather Belt',14,600);
INSERT INTO products VALUES (15,'Travel Bag',15,2000);


INSERT INTO orders VALUES (1,1,DATE '2024-02-01','DELIVERED');
INSERT INTO orders VALUES (2,2,DATE '2024-02-02','SHIPPED');
INSERT INTO orders VALUES (3,3,DATE '2024-02-03','PENDING');
INSERT INTO orders VALUES (4,4,DATE '2024-02-04','DELIVERED');
INSERT INTO orders VALUES (5,5,DATE '2024-02-05','CANCELLED');
INSERT INTO orders VALUES (6,6,DATE '2024-02-06','SHIPPED');
INSERT INTO orders VALUES (7,7,DATE '2024-02-07','DELIVERED');
INSERT INTO orders VALUES (8,8,DATE '2024-02-08','PENDING');
INSERT INTO orders VALUES (9,9,DATE '2024-02-09','DELIVERED');
INSERT INTO orders VALUES (10,10,DATE '2024-02-10','SHIPPED');


INSERT INTO order_items VALUES (1,1,1,1,45000);
INSERT INTO order_items VALUES (2,2,2,1,80000);
INSERT INTO order_items VALUES (3,3,3,1,65000);
INSERT INTO order_items VALUES (4,4,4,2,1800);
INSERT INTO order_items VALUES (5,5,5,1,4000);
INSERT INTO order_items VALUES (6,6,6,1,25000);
INSERT INTO order_items VALUES (7,7,7,1,3000);
INSERT INTO order_items VALUES (8,8,8,2,1400);
INSERT INTO order_items VALUES (9,9,9,1,1500);
INSERT INTO order_items VALUES (10,10,10,3,1500);

select * from order_items;


INSERT INTO payments VALUES (1,1,DATE '2024-02-01','UPI');
INSERT INTO payments VALUES (2,2,DATE '2024-02-02','CARD');
INSERT INTO payments VALUES (3,3,DATE '2024-02-03','COD');
INSERT INTO payments VALUES (4,4,DATE '2024-02-04','UPI');
INSERT INTO payments VALUES (5,5,DATE '2024-02-05','CARD');
INSERT INTO payments VALUES (6,6,DATE '2024-02-06','UPI');
INSERT INTO payments VALUES (7,7,DATE '2024-02-07','COD');
INSERT INTO payments VALUES (8,8,DATE '2024-02-08','CARD');
INSERT INTO payments VALUES (9,9,DATE '2024-02-09','UPI');
INSERT INTO payments VALUES (10,10,DATE '2024-02-10','CARD');


INSERT INTO reviews VALUES (1,1,1,5,DATE '2024-02-11');
INSERT INTO reviews VALUES (2,2,2,4,DATE '2024-02-11');
INSERT INTO reviews VALUES (3,3,3,3,DATE '2024-02-12');
INSERT INTO reviews VALUES (4,4,4,5,DATE '2024-02-12');
INSERT INTO reviews VALUES (5,5,5,4,DATE '2024-02-13');
INSERT INTO reviews VALUES (6,6,6,5,DATE '2024-02-13');
INSERT INTO reviews VALUES (7,7,7,3,DATE '2024-02-14');
INSERT INTO reviews VALUES (8,8,8,4,DATE '2024-02-14');
INSERT INTO reviews VALUES (9,9,9,5,DATE '2024-02-15');
INSERT INTO reviews VALUES (10,10,10,4,DATE '2024-02-15');