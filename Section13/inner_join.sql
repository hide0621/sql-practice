-- inner joinについて学習

select * from employees;

select * from departments;

-- 通常のjoin
select * from employees as emp
inner join departments as dt 
on emp.department_id = dt.id;

-- 特定のカラムを取り出す
select emp.id, emp.first_name, emp.last_name, dt.id as department_id, dt.name as department_name 
from employees as emp
inner join departments as dt 
on emp.department_id = dt.id;

-- 複数のレコードで紐付ける
select * from students as std
inner join users as usr 
on std.first_name = usr.first_name and std.last_name = usr.last_name;

-- =　以外で紐づける方法
select * from employees as emp
inner join students as std 
on emp.id < std.id;

-- left joinの勉強
select emp.id, emp.first_name, emp.last_name, dt.id as department_id, dt.name as department_name 
from employees as emp
left join departments as dt 
on emp.department_id = dt.id;

-- right joinの勉強
select * from students as std
left join enrollments as enr
on std.id = enr.student_id
left join classes as cs 
on enr.class_id = cs.id;

select * from students as std
right join enrollments as enr
on std.id = enr.student_id
right join classes as cs 
on enr.class_id = cs.id;

-- full joinの練習（両方から取り出して、値が取り出せないものはnullとする）
select * from enrollments as enr
full join classes as cs 
on enr.class_id = cs.id;


-- 複雑なテーブル結合を練習する
select 
ct.id, ct.last_name, od.item_id, od.order_amount, od.order_price, od.order_price, it.name, st.name
from customers as ct
inner join orders as od 
on ct.id = od.customer_id
inner join items as it
on od.item_id = it.id
inner join stores as st
on it.store_id = st.id
order by ct.id;

-- where句を交えて複雑なテーブル結合を書く
select 
ct.id, ct.last_name, od.item_id, od.order_amount, od.order_price, od.order_price, it.name, st.name
from customers as ct
inner join orders as od 
on ct.id = od.customer_id
inner join items as it
on od.item_id = it.id
inner join stores as st
on it.store_id = st.id
where ct.id = 10 and od.order_date > '2020-08-01'
order by ct.id;


-- サブクエリを交えて複雑なテーブル結合を書く
-- ただ視認性が下がるので、この書き方はしないこと
select 
ct.id, ct.last_name, od.item_id, od.order_amount, od.order_price, od.order_price, it.name, st.name
from (select * from customers where id = 10 ) as ct
inner join (select * from orders where order_date > '2020-08-01' ) as od 
on ct.id = od.customer_id
inner join items as it
on od.item_id = it.id
inner join stores as st
on it.store_id = st.id
order by ct.id;