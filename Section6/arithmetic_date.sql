-- 算術演算子の学習
select 1 + 1;

select name, age ,age + 3 as age_3 from users limit 10; 

select 10 -5 ;

select birth_day , birth_day + 2 as birth_day_2  from users ;

select 3 * 5;

select department, name, salary * 1.1 from employees ;  

select 10 / 3;

select salary / 10 from employees;

select 10 % 3;

select age % 12 from users;

-- 文字の連結の学習

select department || name from employees;

select department || ':' || name from employees;

select department || ':' || name as 部署：名前 from employees;

-- 日付演算子の学習

select now();

select now() as 現在時刻, name, age from users;

select current_date;

select current_date as 現在の日付 , name, age from users;

select date_part('year', now());

select date_part('month', now());

select date_part('day', now());

select date_part('hour', now());

select date_part('minute', now());

select date_part('second', now());