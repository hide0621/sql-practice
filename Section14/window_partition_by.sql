-- window関数について学習

-- over()の場合
select *, avg(age) over(), count(*) over()
from employees;

-- partition byの場合
select 
*, 
avg(age) over(partition by department_id) as avg_age, 
count(*) over(partition by department_id) as count_department
from employees;

select 
*,
sum(order_amount * order_price) over(partition by order_date)
from orders;

-- window関数内でorder byを使う場合
select 
*,
count(*) over(order by age) as tmp_count
from employees;

select 
*,
sum(order_price) over(order by order_date)
from orders;

select 
*,
sum(order_price) over(order by order_date desc)
from orders;
