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


-- partition byとorder byを併用した際の結果を学習

select 
*,
count(*) over(partition by department_id order by age) as count_value  
from employees;

select 
*,
max(age) over(partition by department_id order by age) as count_value  
from employees;

select 
*,
min(age) over(partition by department_id order by age) as count_value  
from employees;


select 
*,
max(payment) over(partition by emp.id) 
from employees as emp
inner join salaries as sa
on emp.id = sa.employee_id;

select 
*,
sum(sa.payment) over(partition by sa.paid_date order by emp.id) 
from employees as emp
inner join salaries as sa
on emp.id = sa.employee_id;


-- rows , range の練習

-- これだと７日間のうちのその日までの平均は取れない
select 
*,
sum(order_price * order_amount) 
over(order by order_date rows between 6 preceding and current row)
from orders;

-- こっちは上手くいく
with daily_summary as (
select
	order_date,
	sum(order_price * order_amount) as sale
from 
	orders
group by 
	order_date
)
select 
	*,
	avg(sale) over(order by order_date rows between 6 preceding and current row) -- 6行前から現在の行まで
from 
	daily_summary;
