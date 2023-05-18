-- 複雑なupdate処理を書いてみる

select * from employees;

update employees set age = age + 1 where id =1;


select 
* 
from 
employees as emp
where emp.department_id = (select id from departments where name = '営業部');

-- PostgreSQLでは、UPDATE 文の SET 句内での列の参照にはテーブルエイリアスを必要としない
update 
employees as emp
set emp.age = emp.age + 2
where emp.department_id = (select id from departments where name = '営業部');

-- employeesテーブルにdepartment_nameカラムを追加
alter table employees 
add department_name varchar(255);

select emp.* , coalesce(dt.name, '不明') 
from employees as emp
left join departments as dt
on emp.department_id = dt.id;

-- PostgreSQLではLeft Joinは使えないのでエラーになる
UPDATE employees AS emp
LEFT JOIN departments AS dt 
ON emp.department_id = dt.id
SET department_name = COALESCE(dt.name, '不明');


-- 代わりにこのクエリを実行する（ただnullが不明にはならない）
UPDATE employees AS emp
SET department_name = COALESCE(dt.name, '不明')
FROM departments AS dt
WHERE emp.department_id = dt.id;


-- withを使ったupdateの書き方

select * from stores;

alter table stores 
add all_sales int;

select * from items;

select * from orders;


with tmp_sales as (
select it.store_id , sum(od.order_amount * od.order_price) as summary
from items as it
inner join orders as od 
on it.id = od.item_id
group by it.store_id
)
select * from stores as st
inner join tmp_sales as ts 
on st.id = ts.store_id;


-- PostgreSQLではinner joinとupdate文を一緒に書くことは出来ない
with tmp_sales as (
select it.store_id , sum(od.order_amount * od.order_price) as summary
from items as it
inner join orders as od 
on it.id = od.item_id
group by it.store_id
)
update stores as st
inner join tmp_sales as ts 
on st.id = ts.store_id
set st.all_sales = ts.summary;

-- 代わりにこの書き方で書く
WITH tmp_sales AS (
  SELECT it.store_id, SUM(od.order_amount * od.order_price) AS summary
  FROM items AS it
  INNER JOIN orders AS od ON it.id = od.item_id
  GROUP BY it.store_id
)
UPDATE stores AS st
SET all_sales = ts.summary
FROM tmp_sales AS ts
WHERE st.id = ts.store_id;

select * from stores;

