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
