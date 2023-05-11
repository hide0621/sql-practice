-- with句の学習

with tmp_departments as (
	select * from departments where name = '営業部' 
)
select * from employees as e
inner join tmp_departments
on e.department_id = tmp_departments.id;


-- 以下のような複雑なクエリの場合はwith句を使った方が視認性が高い
with tmp_stores as (
	select * from stores where id in (1,2,3)
), 
tmp_items_orders as (
	select 
		items.id as item_id, 
		tmp_stores.id as store_id, 
		orders.id as order_id, 
		orders.order_amount as order_amount, 
		orders.order_price as order_price, 
		tmp_stores.name as store_name
	from tmp_stores
	inner join items 
	on tmp_stores.id = items.store_id
	inner join orders
	on items.id = orders.item_id
)
select 
	store_name, 
	sum(order_amount * order_price) 
from tmp_items_orders
group by store_name;
