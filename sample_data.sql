
INSERT INTO customers VALUES
(1,'Rahul Sharma','rahul@gmail.com','Delhi','2023-01-10'),
(2,'Neha Singh','neha@gmail.com','Mumbai','2023-02-15'),
(3,'Amit Verma','amit@gmail.com','Bangalore','2023-03-12');

INSERT INTO categories VALUES
(1,'Electronics'),
(2,'Fashion'),
(3,'Home');

INSERT INTO products VALUES
(1,'Mobile Phone',1,15000,12000),
(2,'Laptop',1,55000,48000),
(3,'T-Shirt',2,1200,600),
(4,'Sofa',3,30000,25000);

INSERT INTO orders VALUES
(101,1,'2023-04-01','Delivered'),
(102,2,'2023-04-05','Delivered'),
(103,1,'2023-05-01','Returned');

INSERT INTO order_items VALUES
(1,101,1,1,0),
(2,101,3,2,10),
(3,102,2,1,5),
(4,103,4,1,0);

INSERT INTO payments VALUES
(1,101,'UPI','Success','2023-04-01'),
(2,102,'Card','Success','2023-04-05'),
(3,103,'COD','Failed','2023-05-01');

INSERT INTO shipping VALUES
(1,101,'2023-04-02','2023-04-04','Delivered'),
(2,102,'2023-04-06','2023-04-07','Delivered'),
(3,103,'2023-05-02',NULL,'Pending');

INSERT INTO returns VALUES
(1,103,'Damaged Product','2023-05-05');
