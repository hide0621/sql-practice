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


