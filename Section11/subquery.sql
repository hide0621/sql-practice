-- 副問い合わせ（サブクエリ）について学習

select * from employees;

select * from departments;

select * from employees where department_id in (1 ,2);

select id from departments where name in ('経営企画部', '営業部');


-- 副問い合わせの実行

select * from employees where department_id in (
	select id from departments where name in ('経営企画部', '営業部')
);

select * from employees where department_id not in (
	select id from departments where name in ('経営企画部', '営業部')
);


select * from students;
select * from users;

select first_name, last_name from users;


-- 複数カラムの副問い合わせの実行

select * from students
where (first_name, last_name) in (
	select first_name, last_name from users
);

select * from students
where (first_name, last_name) not in (
	select first_name, last_name from users
);


select * from employees;
select max(age) from employees;


-- 集計関数と副問い合わせ

select * from employees 
where age = (
	select max(age) from employees 
);

select * from employees 
where age < (
	select max(age) from employees 
);


-- fromの中に副問い合わせ

select department_id , avg(age) as avg_age from employees group by department_id;

select max(avg_age) as 部署ごとの平均年齢の最大値
from (
	select department_id , avg(age) as avg_age from employees group by department_id
) as tmp_age;


select floor(age/10) * 10 , count(*) as age_count from employees
group by floor(age/10);

select 
	max(age_count) , min(age_count) 
from (
	select floor(age/10) * 10 , count(*) as age_count from employees
	group by floor(age/10)
) as age_summary;


-- selectの中に副問い合わせ

select * from customers;

select * from orders;

select 
	cs.id,
	cs.first_name,
	cs.last_name
from 
	customers as cs
where cs.id < 10;


select 
	cs.id,
	cs.first_name,
	cs.last_name,
	(
	select max(order_date) from orders as order_max where cs.id = order_max.customer_id
	) as 最近の注文日 , 
	(
	select min(order_date) from orders as order_max where cs.id = order_max.customer_id
	) as 古い注文日
from 
	customers as cs
where cs.id < 10;




	


