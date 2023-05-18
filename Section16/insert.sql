-- 複雑なinsert文を書いてみる

select * from customers;

select * from orders;

-- テーブルを作成
create table customer_orders(
	name varchar(255),
	order_date date,
	sales int,
	total_sales int
);

select 
	concat(ct.last_name, ct.first_name) ,
	od.order_date,
	od.order_amount * od.order_price,
	sum(od.order_amount * od.order_price) over(partition by concat(ct.last_name, ct.first_name) order by od.order_date)
from customers as ct
inner join orders as od 
on ct.id = od.customer_id;

-- 複雑なinsert文を書いてみた
insert into customer_orders
select 
	concat(ct.last_name, ct.first_name) ,
	od.order_date,
	od.order_amount * od.order_price,
	sum(od.order_amount * od.order_price) over(partition by concat(ct.last_name, ct.first_name) order by od.order_date)
from customers as ct
inner join orders as od 
on ct.id = od.customer_id;

select * from customer_orders;